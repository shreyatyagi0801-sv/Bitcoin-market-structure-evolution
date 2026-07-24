CREATE OR REPLACE TABLE
`bitcoin-market-structure.bitcoin_analysis.btc_return_metrics`
AS

SELECT
    trade_date,
    open_price,
    high_price,
    low_price,
    close_price,
    volume,

    LAG(close_price,1)
    OVER(ORDER BY trade_date) AS previous_close,

    ROUND(
        (
            (close_price -
             LAG(close_price,1)
             OVER(ORDER BY trade_date))
            /
             LAG(close_price,1)
             OVER(ORDER BY trade_date)
        )*100,
        2
    ) AS daily_return_pct,

    LAG(close_price,7)
    OVER(ORDER BY trade_date) AS weekly_close,

    ROUND(
        (
            (close_price -
             LAG(close_price,7)
             OVER(ORDER BY trade_date))
            /
             LAG(close_price,7)
             OVER(ORDER BY trade_date)
        )*100,
        2
    ) AS weekly_return_pct,

    LAG(close_price,30)
    OVER(ORDER BY trade_date) AS monthly_close,

    ROUND(
        (
            (close_price -
             LAG(close_price,30)
             OVER(ORDER BY trade_date))
            /
             LAG(close_price,30)
             OVER(ORDER BY trade_date)
        )*100,
        2
    ) AS monthly_return_pct

FROM
`bitcoin-market-structure.bitcoin_analysis.btc_price_cleaned`;