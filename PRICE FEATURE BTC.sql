CREATE OR REPLACE TABLE
`bitcoin-market-structure.bitcoin_analysis.btc_price_features`
AS
SELECT
    *,
    
    (close_price - open_price) AS candle_body,
    
    (high_price - low_price) AS daily_range,
    
    ROUND(
        ((close_price - open_price) / open_price) * 100,
        2
    ) AS daily_return_pct

FROM
`bitcoin-market-structure.bitcoin_analysis.btc_price_cleaned`;