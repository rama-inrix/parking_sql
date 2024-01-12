--This query was run on a backup of the prod database, backed up 4/24/23
select wsegs.pk_segment
from (SELECT whoosh.pk_segment
	  FROM
	(SELECT pk_segment, pk_company, str_id
	FROM segment_company_payment
	WHERE pk_company = '0eda6d8b-dcb0-4df8-b425-c35c45aa7c41') AS whoosh 
LEFT JOIN
	(SELECT pk_segment
	FROM segment_company_payment
	WHERE pk_company = 'f3b1e51b-273e-4aca-be89-756a467f937e') AS flowbird USING (pk_segment)
	  WHERE flowbird.pk_segment IS NULL) as wsegs
JOIN segment as s USING (pk_segment)
JOIN meter AS m USING (pk_meter)
WHERE m.pk_city = '9843ecba-17f4-11e2-91bb-12313d1b6657' -- Lille
AND s.str_rates LIKE '%€%'