SELECT m.pk_meter "Meter ID",
	ST_AsText(m.mline_location) "Meter Coords",
	s.str_rates "Rate Card",
	s.dt_rates_as_of_date "Rate Timestamp"
FROM meter AS m
JOIN segment AS s USING (pk_meter)
WHERE m.pk_city = '8fafc7e6-7a52-11df-a429-1be0ad72fc1d'
AND m.pk_operator = 'd0f41732-ced9-11e2-9b22-22000af8682a'
AND m.pk_meter_status = 2
AND s.str_rates LIKE '%$%';