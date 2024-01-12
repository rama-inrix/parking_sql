WITH operators AS (
SELECT c.str_value "Company Name", 
	c.pk_company,
	c.str_url,
	COUNT(DISTINCT l.pk_lot) lots
FROM lot as l
JOIN company as c ON l.pk_operator = c.pk_company
WHERE active_lot(l.pk_lot)
GROUP BY c.pk_company
HAVING COUNT(DISTINCT l.pk_lot) >= 100
)

SELECT o."Company Name", 
   	MODE() WITHIN GROUP (ORDER BY c.str_short_name) "Country",
	o.str_url "Website",
	o.lots "Num. of lots"
FROM operators as o 
JOIN lot as l ON (o.pk_company = l.pk_operator)
JOIN destination as d ON (l.pk_city = d.pk_destination)
JOIN country as c USING (pk_country)
WHERE active_lot(l.pk_lot)
GROUP BY 1, 3, 4
ORDER BY 3 desc;
