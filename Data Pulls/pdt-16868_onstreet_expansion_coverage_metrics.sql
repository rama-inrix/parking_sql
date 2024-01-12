--TOTAL BLOCK COVERAGE

SELECT COUNT(distinct pk_meter) "Total Meters"
FROM meter
WHERE pk_meter_status = 2;

-- W/O EXPANSION
WITH total_cov AS (
	SELECT 1 ind,
		COUNT(distinct pk_meter) total_meters
	FROM meter
	WHERE pk_meter_status = 2
),

sp_bmw_meters AS (
	SELECT COALESCE(d.conflation_market_id, d.i_market_id) market_id,
		COUNT(distinct pk_meter) bmw_meters
	FROM meter as m
	JOIN destination as d ON m.pk_city = d.pk_destination
	WHERE pk_meter_status = 2
	AND COALESCE(d.conflation_market_id, d.i_market_id) IN (44, 266)
	AND d.str_name NOT LIKE '%@30%'
	GROUP BY 1
),

at30cov AS (
	SELECT COALESCE(d.conflation_market_id, d.i_market_id) market_id,
		COUNT(distinct m.pk_meter) at30_meters
	FROM meter as m
	JOIN destination as d ON m.pk_city = d.pk_destination
	WHERE d.str_name LIKE '%@30%'
	AND COALESCE(d.conflation_market_id, d.i_market_id) IN (44, 266, 110)
	GROUP BY 1
),

exp_cov AS (
	SELECT 1 ind,
		SUM(at30_meters) - SUM(bmw_meters) exp_meters
	FROM at30cov
	LEFT JOIN sp_bmw_meters USING (market_id)
)

SELECT total_meters - exp_meters "Total coverage w/o expansion"
FROM total_cov
JOIN exp_cov USING (ind);
	 
-- COVERAGE FOR EACH EXPANSION

WITH bmw_meters AS (
	SELECT COALESCE(d.conflation_market_id, d.i_market_id) market_id,
		COUNT(distinct pk_meter) bmw_meters
	FROM meter as m
	JOIN destination as d ON m.pk_city = d.pk_destination
	WHERE pk_meter_status = 2
	AND COALESCE(d.conflation_market_id, d.i_market_id) IN (44, 266, 110)
	AND d.str_name NOT LIKE '%@30%'
	GROUP BY 1
),

at30cov AS (
	SELECT COALESCE(d.conflation_market_id, d.i_market_id) market_id,
		COUNT(distinct m.pk_meter) at30_meters
	FROM meter as m
	JOIN destination as d ON m.pk_city = d.pk_destination
	WHERE d.str_name LIKE '%@30%'
	AND COALESCE(d.conflation_market_id, d.i_market_id) IN (44, 266, 110)
	GROUP BY 1
)

SELECT d.str_name "City",
	bmw.bmw_meters "Previous Coverage",
	CASE WHEN bmw.market_id = 110 THEN at30.at30_meters
		ELSE at30.at30_meters - bmw.bmw_meters END "Expansion Coverage",
	CASE WHEN bmw.market_id = 110 THEN at30.at30_meters + bmw.bmw_meters
		ELSE at30.at30_meters END "Combined Coverage"
FROM bmw_meters AS bmw
JOIN at30cov AS at30 USING (market_id)
JOIN destination AS d ON d.i_market_id = at30.market_id;