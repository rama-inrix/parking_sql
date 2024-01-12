-- CURRENT COVERAGE, without -30
WITH current_cov AS (
SELECT 
	COALESCE(conflation_market_id, i_market_id) "Market ID",
	ST_AsText(ST_Union(COALESCE(mpoly_onstreet, mpoly_location))) "Polygon", 
	COUNT(DISTINCT pk_meter) "Meter Count",
	ST_Area(ST_Union(COALESCE(mpoly_onstreet, mpoly_location)))/1000000 "Area (km^2)",
	ST_Area(ST_Union(COALESCE(mpoly_onstreet, mpoly_location))) * 3.861E-7 "Area (miles^2)"
FROM destination AS d
JOIN meter AS m ON (m.pk_city = d.pk_destination)
WHERE (COALESCE(conflation_market_id, i_market_id) IN (103, 94, 201, 119, 106, 78, 100)
	   AND i_onstreet_wave IN (1, 2, 3, 4, 5, 11, 12, 13, 15, 16))
OR (COALESCE(conflation_market_id, i_market_id) IN (44, 266) 
	AND i_onstreet_wave IN (1, 2, 3, 4, 5, 11, 12, 13, 15, 16, 30))
GROUP BY COALESCE(conflation_market_id, i_market_id)
)

SELECT d.str_name AS "City Name",
	c."Polygon",
	c."Meter Count",
	c."Area (km^2)",
	c."Area (miles^2)"
FROM current_cov AS c 
JOIN destination AS d ON (d.i_market_id = c."Market ID")

-- Current coverage, -30
WITH current_cov AS (
SELECT 
	COALESCE(conflation_market_id, i_market_id) "Market ID",
	ST_AsText(COALESCE(mpoly_onstreet, mpoly_location)) "Polygon", 
	COUNT(DISTINCT pk_meter) "Meter Count",
	ST_Area(COALESCE(mpoly_onstreet, mpoly_location))/1000000 "Area (km^2)",
	ST_Area(COALESCE(mpoly_onstreet, mpoly_location)) * 3.861E-7 "Area (miles^2)"
FROM destination AS d
JOIN meter AS m ON (m.pk_city = d.pk_destination)
WHERE (COALESCE(conflation_market_id, i_market_id) IN (44, 266) 
	   AND i_onstreet_wave IN (-30))
GROUP BY COALESCE(conflation_market_id, i_market_id),
	ST_AsText(COALESCE(mpoly_onstreet, mpoly_location)), 
	ST_Area(COALESCE(mpoly_onstreet, mpoly_location))/1000000,
	ST_Area(COALESCE(mpoly_onstreet, mpoly_location)) * 3.861E-7
)

SELECT d.str_name AS "City Name",
	c."Polygon",
	c."Meter Count",
	c."Area (km^2)",
	c."Area (miles^2)"
FROM current_cov AS c 
JOIN destination AS d ON (d.i_market_id = c."Market ID")

-- PLANNED EXPANSION COVERAGE, without -30 or LA 30
WITH planned_cov AS (
SELECT 
	COALESCE(conflation_market_id, i_market_id) "Market ID",
	ST_AsText(ST_Union(COALESCE(mpoly_onstreet, mpoly_location))) "Polygon", 
	COUNT(DISTINCT pk_meter) "Meter Count", 
	ST_Area(ST_Union(COALESCE(mpoly_onstreet, mpoly_location)))/1000000 "Area (km^2)",
	ST_Area(ST_Union(COALESCE(mpoly_onstreet, mpoly_location))) * 3.861E-7 "Area (miles^2)"
FROM destination AS d
JOIN meter AS m ON (m.pk_city = d.pk_destination)
WHERE (COALESCE(conflation_market_id, i_market_id) IN (123, 92, 112, 116, 274) 
	   AND i_onstreet_wave IN (1, 2, 3, 4, 5, 11, 12, 13, 15, 16, 30))
	OR pk_destination IN ('1fd51bf4-00ce-47be-aa67-28c5ee94e6ea',
						  '7dda1d0e-2384-48b6-bc86-6f8fe1e2f6ff',
						  '8fad40fc-7a52-11df-bee9-93ec9d1defb1')
GROUP BY COALESCE(conflation_market_id, i_market_id)
)

SELECT d.str_name AS "City Name",
	p."Polygon",
	p."Meter Count",
	p."Area (km^2)",
	p."Area (miles^2)"
FROM planned_cov AS p 
JOIN destination AS d ON (d.i_market_id = p."Market ID")

-- PLANNED EXPANSION COVERAGE, only -30 or LA 30
WITH planned_cov AS (
SELECT 
	COALESCE(conflation_market_id, i_market_id) "Market ID",
	ST_AsText(COALESCE(mpoly_onstreet, mpoly_location)) "Polygon", 
	COUNT(DISTINCT pk_meter) "Meter Count", 
	ST_Area(COALESCE(mpoly_onstreet, mpoly_location))/1000000 "Area (km^2)",
	ST_Area(COALESCE(mpoly_onstreet, mpoly_location)) * 3.861E-7 "Area (miles^2)"
FROM destination AS d
JOIN meter AS m ON (m.pk_city = d.pk_destination)
WHERE (COALESCE(conflation_market_id, i_market_id) IN (123, 92, 112, 116, 274) 
	   AND i_onstreet_wave IN (-30))
	OR pk_destination IN ('04557b80-41db-48fb-97e2-e3ec8d9be554')
GROUP BY COALESCE(conflation_market_id, i_market_id),
	ST_AsText(COALESCE(mpoly_onstreet, mpoly_location)), 
	ST_Area(COALESCE(mpoly_onstreet, mpoly_location))/1000000,
	ST_Area(COALESCE(mpoly_onstreet, mpoly_location)) * 3.861E-7
)

SELECT d.str_name AS "City Name",
	p."Polygon",
	p."Meter Count",
	p."Area (km^2)",
	p."Area (miles^2)"
FROM planned_cov AS p 
JOIN destination AS d ON (d.i_market_id = p."Market ID")

