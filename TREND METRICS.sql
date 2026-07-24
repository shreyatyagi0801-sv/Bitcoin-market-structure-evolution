CREATE OR REPLACE TABLE
`bitcoin-market-structure.bitcoin_analysis.btc_trend_metrics`
AS

SELECT
    *,

    CASE
        WHEN sma50 > sma200
        THEN 'Bullish'

        WHEN sma50 < sma200
        THEN 'Bearish'

        ELSE 'Neutral'
    END AS trend_direction,

    CASE
        WHEN close_price > sma200
        THEN 'Above SMA200'

        ELSE 'Below SMA200'
    END AS price_position,

    CASE
        WHEN
            LAG(sma50) OVER(ORDER BY trade_date)
            <
            LAG(sma200) OVER(ORDER BY trade_date)

            AND

            sma50 > sma200

        THEN 1

        ELSE 0

    END AS golden_cross_flag,

    CASE
        WHEN
            LAG(sma50) OVER(ORDER BY trade_date)
            >
            LAG(sma200) OVER(ORDER BY trade_date)

            AND

            sma50 < sma200

        THEN 1

        ELSE 0

    END AS death_cross_flag

FROM
`bitcoin-market-structure.bitcoin_analysis.btc_moving_average_metrics`;