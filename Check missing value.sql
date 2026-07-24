SELECT *
FROM `bitcoin-market-structure.bitcoin_analysis.Bitcoin market`
WHERE
    Open IS NULL
    OR High IS NULL
    OR Low IS NULL
    OR Close IS NULL
    OR Volume IS NULL;
    