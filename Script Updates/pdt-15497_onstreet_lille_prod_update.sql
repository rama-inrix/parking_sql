-- Block 1: Create table of segments modified
CREATE TABLE tmp_modsegs_15497 (
   pk_segment varchar(36)
);

-- The following must be run from the terminal to populate the table 
-- created above using the csv pulled from the prod database. 
-- The filepath to the CSV and table name must be adjusted accordingly.
-- export PGPASSWORD='djd7NwqDm#TbRA%Yu$0SIuAvw'; psql "user=django_lot2 host=proddb-parkme-prod.cwipgjsh740x.us-west-2.rds.amazonaws.com dbname=pim" -c "\copy tmp_modsegs_15497 FROM '/Users/remimedina/Script Updates/pdt-15497_lille_modified_segments.csv' delimiter ',' csv HEADER"

-- Block 2: Create temp table of segments that will be deleted
CREATE TEMP TABLE tmp_delsegs AS
SELECT scp.pk_segment
FROM segment_company_payment as scp 
	JOIN segment AS s USING (pk_segment)
	JOIN meter AS m USING (pk_meter)
WHERE m.pk_city = '9843ecba-17f4-11e2-91bb-12313d1b6657'
	AND s.str_rates LIKE '%€%'
	AND scp.pk_company != 'f3b1e51b-273e-4aca-be89-756a467f937e';

-- Block 3: Delete from scp using delsegs temp table
DELETE FROM segment_company_payment AS scp
USING tmp_delsegs
WHERE scp.pk_segment = tmp_delsegs.pk_segment;

-- Block 4: Update the meter table using tmp_modsegs_15497 and tmp_delsegs tables
UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW()
FROM (SELECT * FROM tmp_modsegs_15497 
	  UNION ALL 
	  SELECT * FROM tmp_delsegs) AS tmp_allsegs
	JOIN segment USING (pk_segment)
WHERE segment.pk_meter = meter.pk_meter;

-- Block 5
DROP TABLE tmp_modsegs_15497
