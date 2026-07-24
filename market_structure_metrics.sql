CREATE OR REPLACE TABLE
`bitcoin-market-structure.bitcoin_analysis.btc_market_structure_metrics`
AS

WITH structure_base AS (

SELECT
    *,

    LAG(high_price)
    OVER(ORDER BY trade_date)
    AS previous_high,

    LAG(low_price)
    OVER(ORDER BY trade_date)
    AS previous_low

FROM
`bitcoin-market-structure.bitcoin_analysis.btc_trend_metrics`

)

SELECT
    *,

    CASE

        WHEN high_price > previous_high
             AND low_price > previous_low

        THEN 'HH_HL'

        WHEN high_price < previous_high
             AND low_price < previous_low

        THEN 'LH_LL'

        WHEN high_price > previous_high
             AND low_price < previous_low

        THEN 'Expansion'

        WHEN high_price < previous_high
             AND low_price > previous_low

        THEN 'Inside Bar'

        ELSE 'Neutral'

    END AS structure_type,

    CASE

        WHEN high_price > previous_high
             AND low_price > previous_low

        THEN 'Bullish'

        WHEN high_price < previous_high
             AND low_price < previous_low

        THEN 'Bearish'

        ELSE 'Neutral'

    END AS structure_trend

FROM structure_base;