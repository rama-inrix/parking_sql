SELECT s.pk_meter AS "Meter_ID", 
	ST_AsText(s.s_line_location) AS "Seg_Coord",
	s.str_rates AS "Rate_Card", 
	s.dt_rates_as_of_date AS "Rate_Timestamp"
FROM meter AS m 
	JOIN segment AS s USING (pk_meter)
WHERE m.pk_city IN ('98a65ef4-17f4-11e2-8d2d-12313d1b6657', '53011ec9-8ce0-4655-a188-26d3561c79fa')
	AND s.str_rates LIKE '%£%';