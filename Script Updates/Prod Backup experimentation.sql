--EXPERIMENT 1: CTEs making updates wrapped in a transaction test
BEGIN TRANSACTION;

--Block 1
WITH invalid_meter AS (UPDATE meter
					   SET pk_meter_status = 4
					   WHERE pk_meter = 53017198
					   RETURNING pk_meter)
UPDATE segment
SET str_rates = 'No Parking!'
FROM invalid_meter JOIN meter USING (pk_meter)
WHERE segment.pk_meter = invalid_meter.pk_meter
	AND segment.str_rates = 'No Parking'
RETURNING meter.pk_meter, segment.pk_segment, segment.str_rates, meter.pk_meter_status;

--Block 2
select m.pk_meter, m.pk_meter_status, s.pk_segment, s.str_rates
from meter as m join segment as s using (pk_meter)
where pk_meter = 53017198;

ROLLBACK;

--Block 3
select m.pk_meter, m.pk_meter_status, s.pk_segment, s.str_rates
from meter as m join segment as s using (pk_meter)
where pk_meter = 53017198;

-- NOTES: All changes do work as expected. It's worth baring in mind that the returning
-- statement from block 1 does not show the changes made to pk_meter status, but
-- the changes are reflected in the Block 2 query.

-- EXPERIMENT 2: Testing PDT-16124 update to prod:
-- This update was run through middleware and failed at the returning statement.
-- It should add flowbird as a payment provider to all segments that didn't 
-- previously have it, while maintaining EasyPark as a payment provider as well.
BEGIN TRANSACTION;

--Block 1
WITH insert_segs AS(
	SELECT s.pk_segment,
		'f3b1e51b-273e-4aca-be89-756a467f937e' AS pk_company,
		scp.str_id AS payment_id,
        m.pk_meter
	FROM segment AS s
		JOIN meter AS m USING (pk_meter)
		JOIN segment_company_payment AS scp USING (pk_segment)
		LEFT JOIN (
			SELECT *
			FROM segment_company_payment
			WHERE pk_company = 'f3b1e51b-273e-4aca-be89-756a467f937e') AS fb USING (pk_segment)
    WHERE scp.pk_company = 'b3ecbf19-0973-45b8-aaba-20d7858951bb' -- EasyPark pk
	    AND fb.pk_company IS NULL -- Guarantees we're not taking any pk_segments already associated to Flowbird
	    AND m.pk_city = '984614ea-17f4-11e2-a5ea-12313d1b6657' -- Bordeaux
	    AND s.str_rates LIKE '%€%'),
modsegs AS (
	INSERT INTO segment_company_payment (
		pk_segment_company_payment,
		pk_segment,
		pk_company,
		str_id,
		dt_create_date,
		dt_modified_date,
		str_create_who,
		str_modified_who
		)
	SELECT uuid_generate_v4(),
		pk_segment,
		pk_company,
		payment_id,
		NOW(),
		NOW(),
		NULL,
		NULL
	FROM insert_segs
	RETURNING pk_segment
	)
UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW()
FROM modsegs JOIN segment USING (pk_segment)
WHERE meter.pk_meter = segment.pk_meter;

-- Block 2
SELECT distinct pk_company
FROM segment_company_payment as scp
	JOIN segment AS s USING (pk_segment)
	JOIN meter AS m USING (pk_meter)
WHERE s.str_rates LIKE '%€%'
AND m.pk_city = '984614ea-17f4-11e2-a5ea-12313d1b6657' -- Bordeaux

--Block 3
SELECT 'Total Segments', count(distinct pk_segment)
FROM segment_company_payment as scp
	JOIN segment AS s USING (pk_segment)
	JOIN meter AS m USING (pk_meter)
WHERE s.str_rates LIKE '%€%'
AND m.pk_city = '984614ea-17f4-11e2-a5ea-12313d1b6657' -- Bordeaux
UNION ALL
SELECT scp.pk_company, count(distinct pk_segment)
FROM segment_company_payment as scp
	JOIN segment AS s USING (pk_segment)
	JOIN meter AS m USING (pk_meter)
WHERE s.str_rates LIKE '%€%'
AND m.pk_city = '984614ea-17f4-11e2-a5ea-12313d1b6657' -- Bordeaux
GROUP BY scp.pk_company

ROLLBACK;

-- Block 4
SELECT 'Total Segments', count(distinct pk_segment)
FROM segment_company_payment as scp
	JOIN segment AS s USING (pk_segment)
	JOIN meter AS m USING (pk_meter)
WHERE s.str_rates LIKE '%€%'
AND m.pk_city = '984614ea-17f4-11e2-a5ea-12313d1b6657' -- Bordeaux
UNION ALL
SELECT scp.pk_company, count(distinct pk_segment)
FROM segment_company_payment as scp
	JOIN segment AS s USING (pk_segment)
	JOIN meter AS m USING (pk_meter)
WHERE s.str_rates LIKE '%€%'
AND m.pk_city = '984614ea-17f4-11e2-a5ea-12313d1b6657' -- Bordeaux
GROUP BY scp.pk_company

-- NOTES: After some modifications, the code works exactly as intended. 
-- It has a runtime of 1 secs 405 msec.

-- EXPERIMENT 3: PDT-16124 Temp tables making updates wrapped in a transaction test

-- Block 1: Pull meters expected to be modified
SELECT distinct m.pk_meter
FROM segment AS s
	JOIN meter AS m USING (pk_meter)
	JOIN segment_company_payment AS scp USING (pk_segment)
	LEFT JOIN (SELECT * 
			   FROM segment_company_payment 
			   WHERE pk_company = 'f3b1e51b-273e-4aca-be89-756a467f937e') AS fb USING (pk_segment)
WHERE scp.pk_company = 'b3ecbf19-0973-45b8-aaba-20d7858951bb' -- EasyPark pk
	AND fb.pk_company IS NULL -- Guarantees we're not taking any pk_segments already associated to Flowbird
	AND m.pk_city = '984614ea-17f4-11e2-a5ea-12313d1b6657' -- Bordeaux 
	AND s.str_rates LIKE '%€%';
	
-- Block 2: Pull all paid segments in Bordeaux
SELECT distinct s.pk_segment
FROM segment AS s
	JOIN meter AS m USING (pk_meter)
WHERE s.str_rates LIKE '%€%'
	AND m.pk_city = '984614ea-17f4-11e2-a5ea-12313d1b6657' -- Bordeaux

BEGIN TRANSACTION;
-- Block 3: Create temp table of segments with EasyPark and not Flowbird
CREATE TEMP TABLE tmp_insert_segs AS
	SELECT s.pk_segment,
		'f3b1e51b-273e-4aca-be89-756a467f937e' AS pk_company,
		scp.str_id AS payment_id,
		m.pk_meter
	FROM segment AS s
		JOIN meter AS m USING (pk_meter)
		JOIN segment_company_payment AS scp USING (pk_segment)
		LEFT JOIN (
			SELECT * 
			FROM segment_company_payment 
			WHERE pk_company = 'f3b1e51b-273e-4aca-be89-756a467f937e') AS fb USING (pk_segment)
	WHERE scp.pk_company = 'b3ecbf19-0973-45b8-aaba-20d7858951bb' -- EasyPark pk
		AND fb.pk_company IS NULL -- Guarentees we're not taking any pk_segments already associated to Flowbird
		AND m.pk_city = '984614ea-17f4-11e2-a5ea-12313d1b6657' -- Bordeaux 
		AND s.str_rates LIKE '%€%';

-- Block 4: Add segments from tmp table to scp with Flowbird ID
INSERT INTO segment_company_payment (
	pk_segment_company_payment, 
	pk_segment, 
	pk_company, 
	str_id, 
	dt_create_date,
	dt_modified_date,
	str_create_who,
	str_modified_who
	)
SELECT uuid_generate_v4(),
	pk_segment, 
	pk_company, 
	payment_id,
	NOW(),
	NOW(),
	NULL,
	NULL
FROM tmp_insert_segs;

-- Block 5: Update meter table
UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW()
FROM tmp_insert_segs
WHERE tmp_insert_segs.pk_meter = meter.pk_meter;

-- Block 6: Verify meter table modifications. Output should correspond to output of block 1
SELECT pk_meter 
FROM meter 
WHERE dt_modified_date > now()-'10 seconds'::interval;

-- Block 7: Verify count of total segs vs. EasyPark vs. Flowbird (should all have same count)
SELECT 'Total Segments', count(distinct pk_segment)
FROM segment_company_payment as scp
	JOIN segment AS s USING (pk_segment)
	JOIN meter AS m USING (pk_meter)
WHERE s.str_rates LIKE '%€%'
AND m.pk_city = '984614ea-17f4-11e2-a5ea-12313d1b6657' -- Bordeaux
UNION ALL
SELECT scp.pk_company, count(distinct pk_segment)
FROM segment_company_payment as scp
	JOIN segment AS s USING (pk_segment)
	JOIN meter AS m USING (pk_meter)
WHERE s.str_rates LIKE '%€%'
AND m.pk_city = '984614ea-17f4-11e2-a5ea-12313d1b6657' -- Bordeaux
GROUP BY scp.pk_company;

-- Block 8: Verify segments with both EasyPark and Flowbird. Output should correspond to
-- output of block 2.
SELECT s.pk_segment
FROM segment_company_payment AS scp1
	JOIN segment_company_payment as scp2 USING (pk_segment)
	JOIN segment AS s USING (pk_segment)
	JOIN meter AS m USING (pk_meter)
WHERE scp1.pk_company = 'b3ecbf19-0973-45b8-aaba-20d7858951bb'
	AND scp2.pk_company = 'f3b1e51b-273e-4aca-be89-756a467f937e'
	AND s.str_rates LIKE '%€%'
	AND m.pk_city = '984614ea-17f4-11e2-a5ea-12313d1b6657'; -- Bordeaux

ROLLBACK;

-- Block 9: Verify Rollback. Numbers should difer from row to row.
SELECT 'Total Segments', count(distinct pk_segment)
FROM segment_company_payment as scp
	JOIN segment AS s USING (pk_segment)
	JOIN meter AS m USING (pk_meter)
WHERE s.str_rates LIKE '%€%'
AND m.pk_city = '984614ea-17f4-11e2-a5ea-12313d1b6657' -- Bordeaux
UNION ALL
SELECT scp.pk_company, count(distinct pk_segment)
FROM segment_company_payment as scp
	JOIN segment AS s USING (pk_segment)
	JOIN meter AS m USING (pk_meter)
WHERE s.str_rates LIKE '%€%'
AND m.pk_city = '984614ea-17f4-11e2-a5ea-12313d1b6657' -- Bordeaux
GROUP BY scp.pk_company

-- NOTES: The script works exactly as intended. 
-- It has a runtime of 1 secs 531 msec.

-- CONCLUSION: Temp tables are probably a more stable and intuitive approach to
-- updating multiple tables simultaneously. With CTEs, there is risk of
-- modifications not going as intended. 