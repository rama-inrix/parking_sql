BEGIN TRANSACTION;
-- Block 1: Create temp table of segments with EasyPark and not Flowbird
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

-- Block 2: Add segments from tmp table to scp with Flowbird ID
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

-- Block 3: Update meter table
UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW()
FROM tmp_insert_segs
WHERE tmp_insert_segs.pk_meter = meter.pk_meter;

ROLLBACK;