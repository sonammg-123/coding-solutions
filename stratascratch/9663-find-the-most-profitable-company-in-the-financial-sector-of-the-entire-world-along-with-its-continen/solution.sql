WITH case1 AS (
    SELECT MAX(profits) AS max_profit
    FROM forbes_global_2010_2014
    WHERE sector = 'Financials'
)

SELECT
    company,
    continent
FROM forbes_global_2010_2014
INNER JOIN case1 ON forbes_global_2010_2014.profits = case1.max_profit
WHERE sector = 'Financials';
