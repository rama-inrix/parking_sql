-- Solution to ticket PDT-15497 using temp tables
-- Verified to function as intended

-- Block 1: Pull meters expected to be modified
WITH modsegs AS (
SELECT wsegs.pk_segment
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
		AND s.str_rates LIKE '%€%'
UNION ALL
SELECT scp.pk_segment
FROM segment_company_payment as scp 
	JOIN segment AS s USING (pk_segment)
	JOIN meter AS m USING (pk_meter)
WHERE m.pk_city = '9843ecba-17f4-11e2-91bb-12313d1b6657'
	AND s.str_rates LIKE '%€%'
	AND scp.pk_company != 'f3b1e51b-273e-4aca-be89-756a467f937e')

SELECT distinct m.pk_meter
FROM modsegs 
	JOIN segment as s USING (pk_segment)
	JOIN meter AS m USING (pk_meter);


BEGIN TRANSACTION;

-- Block 2: Create temp table of segments with Whoosh and not Flowbird
CREATE TEMP TABLE tmp_modsegs AS 
SELECT distinct wsegs.pk_segment
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
		AND s.str_rates LIKE '%€%'; 

-- Block 3: Change Whoosh to Flowbird
UPDATE segment_company_payment
SET pk_company = 'f3b1e51b-273e-4aca-be89-756a467f937e' -- flowbird
FROM tmp_modsegs
WHERE tmp_modsegs.pk_segment = segment_company_payment.pk_segment
	AND segment_company_payment.pk_company = '0eda6d8b-dcb0-4df8-b425-c35c45aa7c41';

-- Block 4: Create temp table of segments that will be deleted
CREATE TEMP TABLE tmp_delsegs AS
SELECT scp.pk_segment
FROM segment_company_payment as scp 
	JOIN segment AS s USING (pk_segment)
	JOIN meter AS m USING (pk_meter)
WHERE m.pk_city = '9843ecba-17f4-11e2-91bb-12313d1b6657'
	AND s.str_rates LIKE '%€%'
	AND scp.pk_company != 'f3b1e51b-273e-4aca-be89-756a467f937e';

-- Block 5: Delete from scp using delsegs temp table
DELETE FROM segment_company_payment AS scp
USING tmp_delsegs
WHERE scp.pk_segment = tmp_delsegs.pk_segment
AND scp.pk_company != 'f3b1e51b-273e-4aca-be89-756a467f937e';

-- Block 6: Update the meter table using modsegs and delsegs temp tables
UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW()
FROM (SELECT * FROM tmp_modsegs 
	  UNION ALL 
	  SELECT * FROM tmp_delsegs) AS tmp_allsegs
	JOIN segment USING (pk_segment)
WHERE segment.pk_meter = meter.pk_meter;

-- Block 7: Verify meter table modifications. Output should match to output of block 1
SELECT pk_meter 
FROM meter 
WHERE dt_modified_date > now()-'10 seconds'::interval;

-- Block 8: Verify segment_company table modifications. Output should have 0 rows.
SELECT * 
FROM segment_company_payment as scp
	JOIN segment AS s USING (pk_segment)
	JOIN meter AS m USING (pk_meter)
WHERE m.pk_city = '9843ecba-17f4-11e2-91bb-12313d1b6657'
	AND s.str_rates LIKE '%€%'
	AND scp.pk_company != 'f3b1e51b-273e-4aca-be89-756a467f937e';

ROLLBACK;

-- Block 8: Verify Rollback.
SELECT * 
FROM segment_company_payment as scp
	JOIN segment AS s USING (pk_segment)
	JOIN meter AS m USING (pk_meter)
WHERE m.pk_city = '9843ecba-17f4-11e2-91bb-12313d1b6657'
	AND s.str_rates LIKE '%€%'
	AND scp.pk_company != 'f3b1e51b-273e-4aca-be89-756a467f937e';