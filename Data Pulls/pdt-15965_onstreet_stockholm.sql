SELECT s.pk_meter AS "Meter_ID", 
s.str_rates AS "Rate_Card",
s.dt_modified_date AS "Mod_Date", 
ST_AsText(s.s_line_location) AS "Seg_Coord"
FROM meter AS m 
JOIN segment AS s USING (pk_meter)
WHERE m.pk_meter_status = 2 AND
m.pk_city IN ('9e73edba-17f4-11e2-b79c-12313d1b6657', '29a91409-1aad-42d3-b35d-7d3ba85b5d97');