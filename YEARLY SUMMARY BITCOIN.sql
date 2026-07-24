CREATE OR REPLACE TABLE
`bitcoin-market-structure.bitcoin_analysis.btc_yearly_summary`
AS
SELECT
    EXTRACT(YEAR FROM trade_date) AS year,

    COUNT(*) AS trading_days,

    ROUND(AVG(close_price),2) AS average_price,

    ROUND(MAX(high_price),2) AS highest_price,

    ROUND(MIN(low_price),2) AS lowest_price,

    ROUND(AVG(volume),2) AS average_volume

FROM
`bitcoin-market-structure.bitcoin_analysis.btc_price_cleaned`

GROUP BY year

ORDER BY year;