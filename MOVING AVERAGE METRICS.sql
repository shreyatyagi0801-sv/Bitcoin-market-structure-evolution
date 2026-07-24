CREATE OR REPLACE TABLE
`bitcoin-market-structure.bitcoin_analysis.btc_moving_average_metrics`
AS

SELECT
    *,

    ROUND(
        AVG(close_price)
        OVER(
            ORDER BY trade_date
            ROWS BETWEEN 19 PRECEDING AND CURRENT ROW
        ),
        2
    ) AS sma20,

    ROUND(
        AVG(close_price)
        OVER(
            ORDER BY trade_date
            ROWS BETWEEN 49 PRECEDING AND CURRENT ROW
        ),
        2
    ) AS sma50,

    ROUND(
        AVG(close_price)
        OVER(
            ORDER BY trade_date
            ROWS BETWEEN 99 PRECEDING AND CURRENT ROW
        ),
        2
    ) AS sma100,

    ROUND(
        AVG(close_price)
        OVER(
            ORDER BY trade_date
            ROWS BETWEEN 199 PRECEDING AND CURRENT ROW
        ),
        2
    ) AS sma200

FROM
`bitcoin-market-structure.bitcoin_analysis.btc_recovery_metrics`;