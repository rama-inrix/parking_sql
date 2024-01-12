-- For the purposes of running this script update on dev,
-- this query was run on the prod database to generate the table 
-- to be bulk-inserted into the segment_company_payment table as a CSV.
-- For the purposes of updating the prod database, this query can be directly inserted
-- under the INSERT INTO statement.
SELECT s.pk_segment,
	'f3b1e51b-273e-4aca-be89-756a467f937e' AS pk_company,
	scp.str_id AS payment_id
FROM segment AS s
	JOIN meter AS m USING (pk_meter)
	JOIN segment_company_payment AS scp USING (pk_segment)
	LEFT JOIN (
		SELECT * 
		FROM segment_company_payment 
		WHERE pk_company = 'f3b1e51b-273e-4aca-be89-756a467f937e') AS fb USING (pk_segment)
WHERE scp.pk_company = 'b3ecbf19-0973-45b8-aaba-20d7858951bb' -- EasyPark pk
	AND fb.pk_company IS NULL
	AND m.pk_city = '984614ea-17f4-11e2-a5ea-12313d1b6657' -- Bordeaux 
	AND s.str_rates LIKE '%€%'