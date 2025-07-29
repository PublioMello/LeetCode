-- Write a solution to find for each date the number of different products sold and their names.

-- The sold products names for each date should be sorted lexicographically.

-- Return the result table ordered by sell_date.


SELECT
    sell_date,
    count(DISTINCT product) AS num_sold,
    STRING_AGG(DISTINCT product, ',' ORDER BY product) AS products
FROM
    Activities
GROUP BY
    sell_date
Order BY
    sell_date


-- STRING_AGG(expressão, delimitador [ORDER BY ordenação])

-- ARRAY_AGG(DISTINCT product ORDER BY product)


-- Para transformar o array de volta em linhas:
-- SELECT UNNEST(ARRAY_AGG(DISTINCT product ORDER BY product)) FROM ...

-- JSON_AGG(DISTINCT product ORDER BY product)