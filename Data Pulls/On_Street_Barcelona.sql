SELECT s.pk_meter AS "Meter_ID", 
s.str_rates AS "Rate_Card", 
s.dt_modified_date AS "Mod_Date", 
ST_AsText(s.s_line_location) AS "Seg_Coord"
FROM meter AS m 
JOIN segment AS s USING (pk_meter)
WHERE m.pk_meter_status = 2 AND
m.pk_city = '98049344-17f4-11e2-baa1-12313d1b6657';