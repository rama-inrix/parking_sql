SELECT m.pk_meter "Meter ID", 
	s.pk_segment "Segment ID",
	s.str_rates "Rate Card",
	m.dt_modified_date "Last Modified Date",
	ST_AsText(m.mline_location) "Meter Coordinates",
	ST_AsText(s.s_line_location) "Segment Coordinates"
FROM meter AS m JOIN segment AS s USING (pk_meter)
WHERE m.pk_meter_status = 2
	AND m.pk_city IN ('9840eb96-17f4-11e2-801f-12313d1b6657', '9bb0fb5f-04c8-45ed-9154-654a362f64b4')