SELECT m.pk_meter AS "Meter ID",
	s.pk_segment AS "Segment ID",
	s.str_rates AS "Rate Card",
	s.dt_modified_date AS "Last modified date - Segment",
	m.dt_modified_date AS "Last modified date - Meter",
	ST_AsText(s.s_line_location) AS "Segment Geo Location"
FROM meter as m 
JOIN segment AS s USING (pk_meter)
WHERE m.pk_city = '9887d39e-17f4-11e2-8f4c-12313d1b6657';
