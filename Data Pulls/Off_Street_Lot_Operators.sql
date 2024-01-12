SELECT c.str_value AS "Company_Name", 
c.str_phone_office1 AS "Office_Phone1", 
c.str_phone_office2 AS "Office_Phone2", 
c.str_url "Website", 
c.str_city1 AS "City", 
c.str_country1 AS "Country", 
ct.str_value AS "Type",
l.num_lots AS "Num_Lots"
FROM company AS c 
LEFT JOIN company_type AS ct USING (pk_company_type)
LEFT JOIN 
(
	SELECT pk_operator, count(*) AS num_lots
	FROM lot 
	GROUP BY pk_operator) AS l ON c.pk_company = l.pk_operator;