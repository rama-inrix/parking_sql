BEGIN TRANSACTION;

-- Block 1: Create temp table with company pks to add 
CREATE TEMP TABLE tmp_companies AS                                     
WITH companies (c_id, c_name) AS (VALUES
								  ('b3ecbf19-0973-45b8-aaba-20d7858951bb', 'EasyPark'), 
								  ('a3f76382-afd1-4c0d-81c9-dea27ec00ab5', 'Indigo Neo'),
								  ('f3b1e51b-273e-4aca-be89-756a467f937e', 'Flowbird'),
								  ('1f43d4b6-bd0a-4c7b-91f0-f12042a210e3', 'PayByPhone'))
SELECT * FROM companies;

-- Block 2: Create temp table of segment pks, company pks, and payment ids to insert into scp table 
CREATE TEMP TABLE tmp_addsegs (pk_segment varchar(36),
							   pk_company varchar(36),
							   payment_id varchar(36)
							  );

-- Block 3: Populate temp table tmp_addsegs using loop to iterate over tmp_companies
DO
$$
DECLARE
    f record;
BEGIN
    FOR f IN SELECT * FROM tmp_companies
    LOOP -- Iterates through company pks listed in the tmp_companies table above
	INSERT INTO tmp_addsegs
	SELECT distinct s.pk_segment,
	    f.c_id AS pk_company,
	    scp.str_id AS payment_id
	FROM segment AS s
	    JOIN meter AS m USING (pk_meter)
		JOIN segment_company_payment AS scp USING (pk_segment)
	WHERE NOT EXISTS (SELECT 1
					  FROM segment_company_payment AS scp2
					  WHERE scp2.pk_segment = s.pk_segment
					  AND scp2.pk_company = f.c_id) -- Checks if segment pk is already associated with company pk and does not select it if it is
		AND m.pk_city IN ('9840eb96-17f4-11e2-801f-12313d1b6657', '9bb0fb5f-04c8-45ed-9154-654a362f64b4', '991c7ee2-fcc0-444e-a26d-59f837e8f712') -- Paris 
	    AND s.str_rates LIKE '%€%' -- Paid segment
		AND m.pk_meter_status = 2
		AND m.pk_operator = '5fabe71f-2513-463d-bc41-43fb0cb185dd'; -- Operator Mairie de Paris
    end loop;
end;
$$;

-- Block 4: Insert into scp table using tmp_addsegs
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

-- Block 5: Create temp table of segment, company pairs to delete
CREATE TEMP TABLE tmp_delsegs AS
	SELECT scp.pk_segment, scp.pk_company, scp.str_id AS "payment_id"
	FROM segment_company_payment AS scp
	JOIN segment as s USING (pk_segment)
	JOIN meter as m USING (pk_meter)
	WHERE m.pk_city IN ('9840eb96-17f4-11e2-801f-12313d1b6657', '9bb0fb5f-04c8-45ed-9154-654a362f64b4', '991c7ee2-fcc0-444e-a26d-59f837e8f712')
	AND s.str_rates LIKE '%€%'
	AND m.pk_meter_status = 2
	AND m.pk_operator = '5fabe71f-2513-463d-bc41-43fb0cb185dd'
	AND scp.pk_company NOT IN (SELECT c_id FROM tmp_companies);

-- Block 6: Delete from scp using tmp_delsegs
DELETE FROM segment_company_payment AS scp
USING tmp_delsegs AS tmp 
WHERE scp.pk_segment = tmp.pk_segment
AND scp.pk_company = tmp.pk_company;

-- Block 7: Update the meter table using tmp_addsegs
UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW()
FROM tmp_addsegs
	JOIN segment USING (pk_segment)
WHERE segment.pk_meter = meter.pk_meter;

-- Block 8: Update the meter table using tmp_delsegs
UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW()
FROM tmp_delsegs
	JOIN segment USING (pk_segment)
WHERE segment.pk_meter = meter.pk_meter;

-- Block 9: Return added segments and companies (Do not include when pushing to prod)
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

-- Block 11: Return deleted segments and companies (Do not include when pushing to prod)
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
