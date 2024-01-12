SELECT s.pk_meter AS "Meter_ID", 
	ST_AsText(s.s_line_location) AS "Seg_Coord",
	s.str_rates AS "Rate_Card", 
	s.dt_rates_as_of_date AS "Rate_Timestamp"
FROM meter AS m 
	JOIN segment AS s USING (pk_meter)
WHERE m.pk_city IN ('8fb66ce0-7a52-11df-8bdf-bb1f4e1170cb', 'b2e87ed7-4655-4ae5-8953-02e45ae6a2dd')
	AND s.str_rates LIKE '%See Meter%';