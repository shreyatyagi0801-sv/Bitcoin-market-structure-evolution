CREATE OR REPLACE TABLE
`bitcoin-market-structure.bitcoin_analysis.btc_drawdown_metrics`
AS

WITH peak_table AS (

SELECT
    *,

    MAX(close_price)
    OVER(
        ORDER BY trade_date
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS running_peak

FROM
`bitcoin-market-structure.bitcoin_analysis.btc_volatility_metrics`

)

SELECT
    *,

    ROUND(
        (
            (close_price-running_peak)
            /running_peak
        )*100,
        2
    ) AS drawdown_pct,

    MIN(
        ROUND(
            (
                (close_price-running_peak)
                /running_peak
            )*100,
            2
        )
    )
    OVER(
        ORDER BY trade_date
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS max_drawdown_so_far

FROM peak_table;