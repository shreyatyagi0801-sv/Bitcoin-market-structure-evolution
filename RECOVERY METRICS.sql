CREATE OR REPLACE TABLE
`bitcoin-market-structure.bitcoin_analysis.btc_recovery_metrics`
AS

WITH peak_dates AS (

SELECT
    *,

    MAX(
        CASE
            WHEN close_price = running_peak
            THEN trade_date
        END
    )
    OVER(
        ORDER BY trade_date
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS peak_date

FROM
`bitcoin-market-structure.bitcoin_analysis.btc_drawdown_metrics`

)

SELECT
    *,

    DATE_DIFF(
        trade_date,
        peak_date,
        DAY
    ) AS days_since_peak,

    CASE
        WHEN close_price = running_peak
        THEN 1
        ELSE 0
    END AS recovery_flag

FROM peak_dates;