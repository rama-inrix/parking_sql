-- Block 1: Create table to populate with prod output
CREATE TABLE tmp_addsegs_16129 (
   pk_segment varchar(36),
   pk_company varchar(36),
   payment_id varchar(36)
);

-- Block 2: The following must be run from the terminal populate the 
-- table created above using the csv pulled from the prod database. 
-- The filepath to the CSV must be adjusted accordingly.
-- export PGPASSWORD='djd7NwqDm#TbRA%Yu$0SIuAvw'; psql "user=django_lot2 host=devdb-zzz.parkme.com dbname=pim" -c "\copy tmp_addsegs_16129 FROM '/Users/remimedina/Script Updates/pdt-16129_tmp_addsegs.csv' delimiter ',' csv HEADER"

-- Block 3: Insert into scp table using tmp_addsegs_16129
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
FROM tmp_addsegs_16129;

-- Block 4: Update the meter table using tmp_addsegs_16129
UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW()
FROM tmp_addsegs_16129
	JOIN segment USING (pk_segment)
WHERE segment.pk_meter = meter.pk_meter;

-- Block 5: Drop tmp_addsegs_16129 table
DROP TABLE tmp_addsegs_16129;