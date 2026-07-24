CREATE OR REPLACE TABLE
`bitcoin-market-structure.bitcoin_analysis.btc_market_features`
AS

SELECT
    *,

    CASE

        WHEN trend_direction = 'Bullish'
             AND volatility_30d >= 5
        THEN 'High Volatility Bull'

        WHEN trend_direction = 'Bullish'
             AND volatility_30d < 5
        THEN 'Stable Bull'

        WHEN trend_direction = 'Bearish'
             AND volatility_30d >= 5
        THEN 'High Volatility Bear'

        WHEN trend_direction = 'Bearish'
             AND volatility_30d < 5
        THEN 'Stable Bear'

        ELSE 'Sideways'

    END AS market_regime

FROM
`bitcoin-market-structure.bitcoin_analysis.btc_market_structure_metrics`;