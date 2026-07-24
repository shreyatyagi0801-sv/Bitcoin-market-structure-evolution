CREATE OR REPLACE TABLE
`bitcoin-market-structure.bitcoin_analysis.btc_volatility_metrics`
AS

SELECT
    *,

    (high_price-low_price) AS daily_range,

    ROUND(
        ((high_price-low_price)/close_price)*100,
        2
    ) AS daily_range_pct,

    ROUND(
        STDDEV(daily_return_pct)
        OVER(
            ORDER BY trade_date
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ),
        2
    ) AS volatility_7d,

    ROUND(
        STDDEV(daily_return_pct)
        OVER(
            ORDER BY trade_date
            ROWS BETWEEN 29 PRECEDING AND CURRENT ROW
        ),
        2
    ) AS volatility_30d,

    ROUND(
        STDDEV(daily_return_pct)
        OVER(
            ORDER BY trade_date
            ROWS BETWEEN 89 PRECEDING AND CURRENT ROW
        ),
        2
    ) AS volatility_90d

FROM
`bitcoin-market-structure.bitcoin_analysis.btc_return_metrics`;