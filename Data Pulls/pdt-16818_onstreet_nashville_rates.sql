SELECT m.pk_meter "Meter ID",
	ST_AsText(m.mline_location) "Meter Coords",
	s.str_rates "Rate Card",
	s.dt_rates_as_of_date "Rate Timestamp"
FROM meter AS m
JOIN segment AS s USING (pk_meter)
WHERE m.pk_city = '8f8b28fa-7a52-11df-8979-cb46a97d9b3f'
AND m.pk_operator = '40d7da8b-d9dc-48f6-bb65-a64ea6afdbd8'
AND m.pk_meter_status = 2
AND s.str_rates LIKE '%$%';