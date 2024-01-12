SELECT s.pk_meter AS "Meter_ID", 
	s.str_rates AS "Rate_Card",
	s.dt_modified_date AS "Mod_Date", 
	ST_AsText(s.s_line_location) AS "Seg_Coord"
FROM meter AS m 
	JOIN segment AS s USING (pk_meter)
WHERE m.pk_meter_status = 2 
	AND m.pk_city = '8f4ef4fc-7a52-11df-b6bf-5f39bd682706';