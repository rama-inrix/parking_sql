BEGIN TRANSACTION;

-- Block 1: Create temp table of segment pks to modify 
CREATE TEMP TABLE tmp_modsegs AS (
	SELECT distinct s.pk_segment
	FROM segment AS s
		JOIN meter AS m USING (pk_meter)
		JOIN destination AS d ON (m.pk_city = d.pk_destination)
	WHERE m.pk_meter_status = 2
		AND d.pk_country = 'b3633366-ca10-11e1-a4d7-12313d1b6657'
		AND s.str_rates LIKE '%CHF%'
);

-- Block 2: Update the segment table using tmp_modsegs
UPDATE segment
SET str_rates = REPLACE(str_rates, 'CHF', 'Fr')
FROM tmp_modsegs
WHERE tmp_modsegs.pk_segment = segment.pk_segment;

-- Block 3: Update the meter table using tmp_modsegs
UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW()
FROM tmp_modsegs
JOIN segment USING (pk_segment)
WHERE segment.pk_meter = meter.pk_meter;

-- Block 4: Return modified segments and rates (Do not include when pushing to prod)
SELECT s.pk_meter AS "Meter ID", 
	s.pk_segment AS "Segment ID", 
	d.str_name AS "City", 
	c.str_short_name AS "Country",
	s.str_rates AS "New Rates",
	m.pk_user_modified AS "User Modified", 
	m.dt_modified_date AS "Date Modified"
FROM tmp_modsegs AS t
	JOIN segment AS s USING (pk_segment)
	JOIN meter AS m USING (pk_meter)
	JOIN destination AS d ON (m.pk_city = d.pk_destination)
	JOIN country AS c USING (pk_country);
	
COMMIT;

BEGIN TRANSACTION;

UPDATE lot
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	str_rates = REPLACE(str_rates, 'CHF', 'Fr')
FROM destination AS d
WHERE lot.pk_city = d.pk_destination
AND active_lot(pk_lot)
AND d.pk_country = 'b3633366-ca10-11e1-a4d7-12313d1b6657'
AND str_rates LIKE '%CHF%'
RETURNING lot.pk_lot AS "Lot ID", 
	d.str_name AS "City", 
	d.pk_country AS "Country",
	lot.str_rates AS "New Rates",
	lot.pk_user_modified AS "User Modified", 
	lot.dt_modified_date AS "Date Modified";

COMMIT;