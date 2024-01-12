SELECT s.pk_meter AS "Meter_ID", 
s.str_rates AS "Rate_Card", 
s.dt_modified_date AS "Mod_Date", 
ST_AsText(s.s_line_location) AS "Seg_Coord"
FROM meter AS m 
JOIN segment AS s USING (pk_meter)
WHERE m.pk_meter_status = 2 AND
m.pk_city IN ('97fd56ba-17f4-11e2-b6f6-12313d1b6657', '9339da10-4b0c-41f7-949a-abbd013b8a97'
);