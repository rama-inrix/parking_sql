SELECT distinct c.str_short_name,
	s.str_state_abbr
FROM meter 
JOIN destination as d on meter.pk_city = d.pk_destination
JOIN country as c using (pk_country)
LEFT JOIN state as s using (pk_state)
ORDER BY 1, 2;