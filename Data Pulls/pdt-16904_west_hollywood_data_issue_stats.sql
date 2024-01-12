-- How many total parking observations (vehicle counts) have we made in the City of West Hollywood?
SELECT COUNT(distinct pk_data_issue)
FROM data_issue as di
LEFT JOIN meter as m USING (pk_meter)
LEFT JOIN lot as l USING (pk_lot)
JOIN destination as d ON (m.pk_city = d.pk_destination
						  OR l.pk_city = d.pk_destination)
WHERE d.pk_destination = '8fafc7e6-7a52-11df-a429-1be0ad72fc1d'
AND di.b_enabled IS TRUE;

-- When did these counts begin for West Hollywood?
SELECT MIN(di.dt_create_date)
FROM data_issue as di
LEFT JOIN meter as m USING (pk_meter)
LEFT JOIN lot as l USING (pk_lot)
JOIN destination as d ON (m.pk_city = d.pk_destination
						  OR l.pk_city = d.pk_destination)
WHERE d.pk_destination = '8fafc7e6-7a52-11df-a429-1be0ad72fc1d'
AND di.b_enabled IS TRUE;

-- When was the first record of on-street parking in any city?
SELECT MIN(di.dt_create_date)
FROM data_issue as di
WHERE di.b_enabled IS TRUE;

-- How many total observations do we have worldwide all time?
SELECT COUNT(distinct pk_data_issue)
FROM data_issue as di
WHERE di.b_enabled IS TRUE;

-- How many blocks, length of curb, and total on-street spaces do we have in West Hollywood?
WITH parking_segs AS (
	SELECT distinct pk_segment
	FROM segment as s
	JOIN meter as m USING (pk_meter)
	JOIN segment_policy AS sp USING (pk_segment)
	JOIN segment_rule AS sr USING (pk_policy)
	WHERE sr.str_activity IN ('parking', 'loading')
	AND m.pk_city = '8fafc7e6-7a52-11df-a429-1be0ad72fc1d'
)

SELECT COUNT(distinct pk_meter) "Blocks",
	ROUND(SUM(ST_length(mline_location::geography)/1000)::numeric, 2) "Curb Length (km)",
	SUM(COALESCE(s.i_spaces, s.i_spaces_calculated)) 
		FILTER (WHERE p.pk_segment IS NOT NULL) "Spaces"
FROM meter as m
JOIN segment as s USING (pk_meter)
LEFT JOIN parking_segs as p USING (pk_segment)
WHERE pk_meter_status = 2
AND pk_city = '8fafc7e6-7a52-11df-a429-1be0ad72fc1d';

-- How many total spaces and off-street parking POIs do we have in West Hollywood?
SELECT COUNT(distinct pk_lot) "Lots",
	SUM(COALESCE(i_spaces, i_spaces_calculated)) "Spaces"
FROM lot as l
WHERE active_lot(pk_lot)
AND pk_city = '8fafc7e6-7a52-11df-a429-1be0ad72fc1d';
