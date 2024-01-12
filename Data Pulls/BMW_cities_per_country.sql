WITH meter_coverage AS(    
	SELECT
		country.str_short_name "Country",
		REGEXP_REPLACE(destination.str_name, '(@.*|\s-.*)', '') "City",
		COALESCE(destination.conflation_market_id, destination.i_market_id) "Market ID",
		COUNT(DISTINCT meter.pk_meter) "Blocks"
    FROM meter
    JOIN destination ON (pk_city = pk_destination)
	JOIN country USING (pk_country)
	WHERE i_onstreet_wave IN (1,2,3,4,5,11,12,13,15,16) AND pk_meter_status = 2    
	GROUP BY 1,2,3)
	
SELECT
	meter_coverage."Country",
	count(meter_coverage."City") "BMW_Cities",
	sum(meter_coverage."Blocks") AS "Total_Blocks"
FROM meter_coverage
GROUP BY 1
ORDER BY 1;