SELECT distinct m.pk_meter "Meter ID",
	ST_AsText(m.mline_location) "Coordinates",
	d.str_name || ', ' || COALESCE(st.str_state_abbr || ', ', '')  || c.str_short_name "City"
FROM meter AS m
JOIN destination AS d ON (m.pk_city = d.pk_destination)
JOIN segment AS s USING (pk_meter)
JOIN country AS c USING (pk_country)
LEFT JOIN state AS st USING (pk_state)
WHERE lower(s.str_rates) LIKE '%construction%';