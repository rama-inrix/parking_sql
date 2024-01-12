SELECT s.pk_meter AS "Meter_ID",
ST_AsText(s.s_line_location) AS "Seg_Coord",
s.str_rates AS "Rate_Card",
s.dt_rates_as_of_date AS "Rate_Timestamp"
FROM meter AS m 
JOIN segment AS s USING (pk_meter)
WHERE m.pk_city = '8f855a92-7a52-11df-abf4-37f3ed537a28'
AND s.str_rates LIKE '%$%';