WITH meter_coverage AS(
	SELECT
		country.str_continent_code "Continent",
		country.str_short_name "Country",
		REGEXP_REPLACE(destination.str_name, '(@.*|\s-.*)', '') "City",
		COALESCE(destination.conflation_market_id, destination.i_market_id) "Market ID",
		COUNT(DISTINCT meter.pk_meter) "Blocks"
    FROM meter
    JOIN destination ON (pk_city = pk_destination)
	JOIN country USING (pk_country)
	WHERE i_onstreet_wave IN (1,2,3,4,5,11,12,13,15,16) AND pk_meter_status = 2
	GROUP BY 1,2,3,4)
	
SELECT
	meter_coverage."Continent",
	meter_coverage."Country",
	meter_coverage."City",
	meter_coverage."Market ID",
	meter_coverage."Blocks"
FROM meter_coverage
ORDER BY 1,2,3;