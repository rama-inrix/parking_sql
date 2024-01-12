BEGIN TRANSACTION;

-- Block 1: Create temp table of segment pks, company pks, and payment ids to insert into scp table 
CREATE TEMP TABLE tmp_addsegs AS (
SELECT distinct s.pk_segment,
    'd3372718-dd66-4c69-8a22-9d5ebcd207e2' AS pk_company,
    scp.str_id AS payment_id
FROM segment_company_payment AS scp
	JOIN segment AS s USING (pk_segment)
	JOIN meter AS m USING (pk_meter)
WHERE m.pk_meter_status = 2
	AND m.pk_city IN ('94978eb4-3a98-4223-9e5d-8d63e429f393',
					  '0725d895-fb7a-4920-a0bd-3ef05832cfb7',
					  '907dff4c-76f5-4ce3-87d4-344b81372f3d',
					  '8fa1d7a8-7a52-11df-b7ed-5b0c599fe066')
	AND s.str_rates LIKE '%$%'
	AND m.pk_operator = '19445e86-70b4-11e2-a053-22000af84509'
	AND (s.pk_segment, 'd3372718-dd66-4c69-8a22-9d5ebcd207e2') NOT IN (SELECT pk_segment, pk_company
																	   FROM segment_company_payment)
);

-- Block 2: Insert into scp table using tmp_addsegs
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
FROM tmp_addsegs;

-- Block 3: Create temp table of segment, company pairs to delete
CREATE TEMP TABLE tmp_delsegs AS
	SELECT scp.pk_segment, scp.pk_company, scp.str_id AS "payment_id"
	FROM segment_company_payment AS scp
	JOIN segment as s USING (pk_segment)
	JOIN meter as m USING (pk_meter)
	WHERE m.pk_city IN ('94978eb4-3a98-4223-9e5d-8d63e429f393',
						'0725d895-fb7a-4920-a0bd-3ef05832cfb7',
					    '907dff4c-76f5-4ce3-87d4-344b81372f3d',
					    '8fa1d7a8-7a52-11df-b7ed-5b0c599fe066')
	AND s.str_rates LIKE '%$%'
	AND m.pk_meter_status = 2
	AND m.pk_operator = '19445e86-70b4-11e2-a053-22000af84509'
	AND scp.pk_company != 'd3372718-dd66-4c69-8a22-9d5ebcd207e2';

-- Block 4: Delete from scp using tmp_delsegs
DELETE FROM segment_company_payment AS scp
USING tmp_delsegs AS tmp 
WHERE scp.pk_segment = tmp.pk_segment
AND scp.pk_company = tmp.pk_company;

-- Block 5: Update the meter table using tmp_addsegs
UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW()
FROM tmp_addsegs
	JOIN segment USING (pk_segment)
WHERE segment.pk_meter = meter.pk_meter;

-- Block 6: Update the meter table using tmp_delsegs
UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW()
FROM tmp_delsegs
	JOIN segment USING (pk_segment)
WHERE segment.pk_meter = meter.pk_meter;

-- Block 7: Return added segments and companies (Do not include when pushing to prod)
SELECT s.pk_meter AS "Meter ID", 
	s.pk_segment AS "Segment ID", 
	m.pk_city AS "City", 
	a.pk_company AS "Company",
	a.payment_id AS "Payment ID",
	m.pk_user_modified AS "User Modified", 
	m.dt_modified_date AS "Date Modified"
FROM tmp_addsegs AS a
	JOIN segment AS s USING (pk_segment)
	JOIN meter AS m USING (pk_meter);

-- Block 8: Return deleted segments and companies (Do not include when pushing to prod)
SELECT s.pk_meter AS "Meter ID", 
	s.pk_segment AS "Segment ID", 
	m.pk_city AS "City", 
	d.pk_company AS "Company",
	d.payment_id AS "Payment ID",
	m.pk_user_modified AS "User Modified", 
	m.dt_modified_date AS "Date Modified"
FROM tmp_delsegs AS d
	JOIN segment AS s USING (pk_segment)
	JOIN meter AS m USING (pk_meter);

COMMIT;
