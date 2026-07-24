SELECT *
FROM `bitcoin-market-structure.bitcoin_analysis.Bitcoin market`
WHERE
    High < Low
    OR Open < 0
    OR Close < 0;