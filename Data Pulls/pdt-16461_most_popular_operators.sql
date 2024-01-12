-- Offstreet
SELECT l.pk_operator, c.str_value, count(distinct l.pk_lot) AS "No. Lots"
FROM lot as l JOIN company as c ON l.pk_operator = c.pk_company
WHERE l.pk_operator IS NOT NULL
AND l.str_rates LIKE '%$%'
GROUP BY l.pk_operator, c.str_value
ORDER BY 3 desc
LIMIT 10

-- Onstreet
SELECT m.pk_operator, c.str_value, count(distinct m.pk_meter) AS "No. Meters"
FROM meter as m JOIN segment as s USING (pk_meter) 
JOIN company as c ON m.pk_operator = c.pk_company
WHERE m.pk_operator IS NOT NULL
AND s.str_rates LIKE '%$%'
GROUP BY pk_operator, c.str_value
ORDER BY 3 desc
LIMIT 3