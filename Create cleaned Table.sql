CREATE OR REPLACE TABLE
`bitcoin-market-structure.bitcoin_analysis.btc_price_cleaned`
AS
SELECT
    Price AS trade_date,
    Open AS open_price,
    High AS high_price,
    Low AS low_price,
    Close AS close_price,
    Volume AS volume
FROM
   `bitcoin-market-structure.bitcoin_analysis.Bitcoin market`