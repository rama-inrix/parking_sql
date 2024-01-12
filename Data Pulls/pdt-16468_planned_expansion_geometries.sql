--New meters per city
SELECT REGEXP_REPLACE(d.str_name, '(@.*|\s-.*)', '') AS "City Name", 
	COUNT(m.pk_meter) AS "New Meters",
	COUNT(m.pk_meter)/2160 AS "Days to complete"
FROM destination AS d
JOIN meter AS m ON (m.pk_city = d.pk_destination)
WHERE REGEXP_REPLACE(d.str_name, '(@.*|\s-.*)', '') IN ('Seattle',
														'Portland',
														'Miami',
														'Los Angeles',
														'Philadelphia',
														'San Jose',
														'Minneapolis',
														'Miami Beach',
														'Boston',
														'New York',
														'Denver',
														'Austin',
														'Washington D.C.',
														'Long Beach',
														'Cambridge',
														'Chicago',
														'Coral Gables',
														'Omaha',
														'Pittsburgh',
														'Providence',
														'Fayetteville',
														'Detroit',
														'San Diego',
														'Columbus',
														'Atlanta',
														'Indianapolis',
														'Louisville',
														'Tampa',
														'London',
														'Berlin',
														'Paris',
														'Rome',
														'Madrid',
														'Toronto',
														'Houston',
														'Montreal',
														'Barcelona',
														'Munich',
														'Milan',
														'Dallas',
														'Stockholm',
														'Amsterdam',
														'Oslo',
														'Vancouver',
														'Bergen',
														'Brussels')
AND d.str_category = 'CITY'
AND d.i_market_id < 1000000
AND d.i_market_id !=1214 
AND d.i_market_id != 312
AND pk_meter_status = 7
GROUP BY REGEXP_REPLACE(d.str_name, '(@.*|\s-.*)', '')
;

-- Temp table with estimated dates of completion
BEGIN;
CREATE TEMP TABLE tmp_dates AS                                     
WITH cities (name, date) AS (VALUES 
							 ('Seattle', '2023-03-10'),
							 ('Portland', '2023-05-05'),
							 ('Miami', '2023-06-27'),
							 ('Los Angeles', '2023-11-19'),
							 ('Philadelphia', '2024-02-13'),
							 ('San Jose', '2024-04-21'),
							 ('Minneapolis', '2024-05-21'),
							 ('Miami Beach', '2024-05-23'),
							 ('Boston',	'2024-06-24'),
							 ('New York', '2024-11-14'),
							 ('Denver',	'2025-01-13'),
							 ('Austin',	'2025-04-03'),
							 ('Washington, D.C.', '2025-05-04'),
							 ('Long Beach', '2025-06-01'),
							 ('Cambridge', '2025-06-07'),
							 ('Chicago', '2025-09-21'),
							 ('Coral Gables', '2025-09-29'),
							 ('Omaha', '2025-12-09'),
							 ('Pittsburgh', '2026-01-22'),
							 ('Providence',	'2026-02-08'),
							 ('Fayetteville', '2026-03-05'),
							 ('Detroit', '2026-05-21'),
							 ('San Diego', '2026-08-25'),
							 ('Columbus', '2026-11-26'),
							 ('Atlanta', '2027-01-07'),
							 ('Indianapolis', '2027-05-02'),
							 ('Louisville', '2027-07-23'),
							 ('Tampa', '2027-09-08'),
							 ('London', '2027-09-16'),
							 ('Paris', '2027-10-01'),
							 ('Brussels', '2028-12-07'))
SELECT * FROM cities;

-- City info + dates + geometries
WITH at30 AS (
	select i_market_id, str_name, mpoly_onstreet, i_onstreet_wave
	from destination
	where i_onstreet_wave IN (30, -30))
SELECT d.str_name as "City Name",
	s.str_state_abbr as "State",
	c.str_short_name as "Country",
	ST_AsText(at30.mpoly_onstreet) as "WKT Geometry",
	tmp.date as "Estimated Date of Completion"
FROM destination as d
	JOIN at30 ON (REGEXP_REPLACE(at30.str_name, '(@.*|\s-.*)', '') = d.str_name)
	LEFT JOIN state as s USING (pk_state)
	JOIN country as c ON c.pk_country = d.pk_country
	JOIN tmp_dates AS tmp ON tmp.name = REGEXP_REPLACE(d.str_name, '(@.*|\s-.*)', '')
WHERE d.str_category = 'CITY'
	AND d.i_market_id < 1000000
	AND d.i_market_id !=1214 
	AND d.i_market_id != 312;
