-- Block 1: Create temp table with company pks to add 
CREATE TEMP TABLE tmp_companies AS                                     
WITH companies (c_id, c_name) AS (VALUES
								  ('1767a4b8-0564-4dae-a1e6-ea7722bfe2a4', 'Seety'), 
								  ('f875e5a2-8dad-464f-867c-bfc05ee5b942', 'Yellowbrick'), 
								  ('a9dee904-8364-4654-bdb9-386c585dcfbb', 'SMSParking'),
								  ('179b3c63-ad0f-4714-8007-b4480d5fa72c', 'MKB Brandstof'),
								  ('f3a02d01-4e38-4342-8d22-f11b3c9c799e', 'ease2pay'),
								  ('2aa79d5c-7734-4171-be26-249a87b2980c', 'PARKD'),
								  ('59836a4d-29d0-4bd5-b605-555f4247bb9f', 'Q-Park app'),
								  ('6457e466-e442-491c-9f18-a33d2c7eb8a5', 'ULU'),
								  ('b3ecbf19-0973-45b8-aaba-20d7858951bb', 'EasyPark'),
								  ('a680a82a-5c78-4d91-ad6a-c4feef378ef4', 'tanQyou'),
								  ('33922f82-36f4-41b2-9281-021a0fb9fc0e', 'Flitsmeister (via 4411)'),
								  ('c32a2495-5306-4cd2-a85e-7949d84cb485', 'MobiFi'),
								  ('916e38f6-f6dd-43f5-87df-eba8163aef29', 'Stadsparkeren'),
								  ('3f831899-357f-4b82-a3a2-74f0ecc45262', 'Lekker Parkeren'),
								  ('7fa6bf76-3355-493e-90fa-3fb8b748059b', 'Gaiyo'))
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
		AND m.pk_city IN ('9d33c286-17f4-11e2-81f8-12313d1b6657', '2fad4596-6728-4a24-b100-5f099e8a179a') -- The Hague 
	    AND s.str_rates LIKE '%€%' -- Paid segment
		AND m.pk_operator = '508cf112-eb00-4301-90f3-fd90cbb3e816'; -- Operator Gemeente Den Haag
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
	SELECT scp.pk_segment, scp.pk_company
	FROM segment_company_payment AS scp
	JOIN segment as s USING (pk_segment)
	JOIN meter as m USING (pk_meter)
	LEFT JOIN tmp_companies AS tmp ON scp.pk_company = tmp.c_id
	WHERE m.pk_city IN ('9d33c286-17f4-11e2-81f8-12313d1b6657', '2fad4596-6728-4a24-b100-5f099e8a179a')
	AND s.str_rates LIKE '%€%'
	AND m.pk_operator = '508cf112-eb00-4301-90f3-fd90cbb3e816'
	AND tmp.c_id IS NULL;

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