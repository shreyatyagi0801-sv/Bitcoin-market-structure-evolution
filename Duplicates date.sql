SELECT Price, COUNT(*) AS duplicate_count
FROM `bitcoin-market-structure.bitcoin_analysis.Bitcoin market`
GROUP BY Price
HAVING COUNT(*) > 1;