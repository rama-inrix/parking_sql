--THIS WAS THE QUERY THAT WAS FINALLY RUN SUCCESSFULLY
BEGIN TRANSACTION;
UPDATE segment_company_payment
SET pk_company = 'f3b1e51b-273e-4aca-be89-756a467f937e' -- flowbird 
FROM (
	SELECT wsegs.pk_segment, wsegs.pk_company 
	FROM (SELECT whoosh.pk_segment, whoosh.pk_company, whoosh.str_id 
		  FROM (SELECT pk_segment, pk_company, str_id 
				FROM segment_company_payment 
				WHERE pk_company = '0eda6d8b-dcb0-4df8-b425-c35c45aa7c41') AS whoosh 
		  LEFT JOIN (SELECT pk_segment 
					 FROM segment_company_payment 
					 WHERE pk_company = 'f3b1e51b-273e-4aca-be89-756a467f937e') AS flowbird USING (pk_segment) 
		  WHERE flowbird.pk_segment is NULL) AS wsegs 
	INNER JOIN segment AS s USING (pk_segment) 
	INNER JOIN meter AS m USING (pk_meter) 
	WHERE m.pk_city = '9843ecba-17f4-11e2-91bb-12313d1b6657' -- Lille 
		AND s.str_rates LIKE '%€%' ) xyz 
WHERE segment_company_payment.pk_segment = xyz.pk_segment 
	AND segment_company_payment.pk_company = xyz.pk_company 
RETURNING segment_company_payment.pk_segment, segment_company_payment.pk_company; 
 
ROLLBACK;


--This was the initial attempt with various CTEs in use.
BEGIN TRANSACTION;
WITH modmeters AS (
	--Change Whoosh pk to Flowbird pk on all paid blocks in Lille
	UPDATE segment_company_payment
	SET pk_company = 'f3b1e51b-273e-4aca-be89-756a467f937e' -- flowbird
	FROM (	-- Table of segment pks that have Whoosh but not Flowbird as a company		
		SELECT whoosh.pk_segment, whoosh.pk_company, whoosh.str_id
		FROM (
			SELECT pk_segment, pk_company, str_id
			FROM segment_company_payment
			WHERE pk_company = '0eda6d8b-dcb0-4df8-b425-c35c45aa7c41') AS whoosh 
			LEFT JOIN (
				SELECT pk_segment
				FROM segment_company_payment
				WHERE pk_company = 'f3b1e51b-273e-4aca-be89-756a467f937e') AS flowbird 
			USING (pk_segment)
		WHERE flowbird.pk_segment is NULL) AS wsegs
		-- end
		INNER JOIN segment AS s USING (pk_segment)
		INNER JOIN meter AS m USING (pk_meter)
		WHERE m.pk_city = '9843ecba-17f4-11e2-91bb-12313d1b6657' -- Lille
			AND s.str_rates LIKE '%€%'
		--AND s.pk_segment != '855c6f77-e545-4f7e-afd7-338350efbfdf'
	WHERE segment_company_payment.pk_segment = wsegs.pk_segment
	RETURNING m.pk_meter
--	RETURNING wsegs.str_id, wsegs.pk_segment, wsegs.pk_company, 
--	m.pk_meter, m.pk_city
	)
UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW()
FROM modmeters
WHERE modmeters.pk_meter = meter.pk_meter;
--RETURNING modmeters.str_id, modmeters.pk_segment, modmeters.pk_company, 
--	modmeters.pk_meter, modmeters.pk_city, meter.pk_user_modified, meter.dt_modified_date;

-- Remove all rows from segment_company_payment that correspond to Lille where company isn't Flowbird
DELETE FROM segment_company_payment AS scp
USING segment AS s,
	meter AS m
WHERE scp.pk_segment = s.pk_segment
	AND s.pk_meter = m.pk_meter
	AND m.pk_city = '9843ecba-17f4-11e2-91bb-12313d1b6657'
	AND scp.pk_company != 'f3b1e51b-273e-4aca-be89-756a467f937e';
--RETURNING scp.str_id, scp.pk_segment, scp.pk_company, 
--m.pk_meter, m.pk_city; 
ROLLBACK;
