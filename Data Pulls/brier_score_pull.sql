WITH last_date AS (
	SELECT
		pk_reporting_id AS city_id, 
		MAX(dt_create_date) AS max_date
	FROM qpark_kpis
	WHERE metric = 'OnStreet-Brier Score'
	GROUP BY pk_reporting_id
	)
SELECT DISTINCT ON (rr.str_name, last_date.city_id)
	rr.str_name "City",
    state.str_state_abbr "State",
    c.str_iso_3166 "Country",
    c.str_continent_code "Continent",
	qk.dt_month "Date",
	ROUND(qk.value::NUMERIC, 3) "Brier Score",
    CASE
        WHEN qk.value <= 0.20 THEN 'A'
        WHEN (qk.value > 0.20  AND qk.value <= 0.25) THEN 'B'
        WHEN qk.value > 0.25 THEN 'C'
    END "Quality Level"
FROM last_date
	JOIN qpark_kpis AS qk ON (qk.pk_reporting_id = last_date.city_id AND qk.dt_create_date = last_date.max_date)
	JOIN reporting_region rr USING (pk_reporting_id)
	JOIN destination AS d ON d.pk_destination = ANY(rr.market_ids)
	JOIN country c USING (pk_country)
	LEFT JOIN state ON d.pk_state = state.pk_state AND d.pk_state IS NOT NULL
;