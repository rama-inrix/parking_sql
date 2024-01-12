SELECT s.pk_meter AS "Meter_ID", 
	ST_AsText(s.s_line_location) AS "Seg_Coord",
	s.str_rates AS "Rate_Card", 
	s.dt_rates_as_of_date AS "Rate_Timestamp"
FROM meter AS m 
	JOIN segment AS s USING (pk_meter)
WHERE m.pk_city = '9843ecba-17f4-11e2-91bb-12313d1b6657'
and s.str_rates LIKE '%€%'