WITH cities AS (
	SELECT i_market_id
	FROM destination as d
	WHERE b_premium and str_name IN ('Amsterdam', 'Barcelona', 'Boston', 'Houston', 'Miami',
									 'Philadelphia', 'San Francisco', 'San Jose', 'Vancouver',
									 'Zurich', 'Atlanta', 'Brussels', 'Charlotte', 'Frankfurt',
									 'Jacksonville', 'Las Vegas', 'Lyon', 'Miami Beach', 'Milan',
									 'San Antonio', 'Berkeley', 'Chicago', 'Columbus', 'Madrid',
									 'Munich', 'Oakland', 'Phoenix', 'Rome', 'San Diego', 'Toronto',
									 'Dallas', 'Denver', 'Indianapolis', 'Liverpool', 'Long Beach',
									 'Montréal', 'Oslo', 'Seattle', 'Stockholm', 'Stuttgart', 'Austin', 
									 'Bergen', 'Bordeaux', 'Cambridge', 'Cologne', 'Dortmund', 
									 'Fort Worth', 'Santa Monica', 'Vienna', 'Washington, D.C.', 
									 'Alexandria', 'Birmingham', 'Calgary', 'Cupertino', 'Hamburg',
									 'Marseille', 'Naples', 'Palo Alto', 'Portland', 'Raleigh', 'Berlin',
									 'Detroit', 'London', 'Paris', 'Turin', 'Los Angeles', 'New York')
),
destinations AS (
	SELECT d.pk_destination,
		d.str_name,
		c.i_market_id
	FROM destination as d
	JOIN cities as c ON COALESCE(d.conflation_market_id, d.i_market_id) = c.i_market_id
),

no_parking_meters AS (
	SELECT pk_meter
	FROM meter as m
	JOIN destinations as d ON m.pk_city = d.pk_destination
	WHERE NOT EXISTS (SELECT *
					  FROM segment AS s
					  JOIN segment_policy AS sp USING (pk_segment)
					  JOIN segment_rule AS sr USING (pk_policy)
					  WHERE s.pk_meter = m.pk_meter
					  AND sr.str_activity != 'no parking')
),

paid_meters AS (
	SELECT s.pk_meter
	FROM segment AS s
	JOIN segment_policy AS sp USING (pk_segment)
	JOIN segment_rule AS sr USING (pk_policy)
	JOIN segment_rate AS srt ON (sp.pk_policy = srt.pk_policy)
	WHERE b_driveway IS FALSE
	AND sr.str_activity = 'parking'
	AND srt.f_rate > 0
) 

SELECT d.i_market_id "Market ID",
	REGEXP_REPLACE(d.str_name, '(@.*|\s-.*)', '') "City",
	COUNT(distinct pk_meter) FILTER (WHERE m.pk_meter_status = 2) AS "Verified Blocks",
	COUNT(distinct pk_meter) FILTER (WHERE m.pk_meter_status IN (4, 8)) AS "Inactive/Invalid Blocks",
	COUNT(distinct pk_meter) FILTER (WHERE pm.pk_meter IS NOT NULL) AS "Paid Blocks",
	COUNT(distinct pk_meter) FILTER (WHERE npm.pk_meter IS NOT NULL) AS "Blocks that have No Parking Only Segments",
	COUNT(distinct pk_meter) FILTER (WHERE m.dt_modified_date < '2019-04-01')AS "Blocks processed before April 2019",
	COUNT(distinct pk_meter) FILTER (WHERE s.dt_rates_as_of_date < '2019-04-01')AS "Blocks w/ rate updated before April 2019",
	COUNT(distinct pk_meter) FILTER (WHERE lower(s.str_rates) LIKE '%construction%') AS "Blocks with Construction Segments"
FROM meter as m
JOIN segment as s USING (pk_meter)
LEFT JOIN paid_meters as pm USING (pk_meter)
LEFT JOIN no_parking_meters as npm USING (pk_meter)
JOIN destinations as d ON m.pk_city = d.pk_destination
GROUP BY 1, 2;
