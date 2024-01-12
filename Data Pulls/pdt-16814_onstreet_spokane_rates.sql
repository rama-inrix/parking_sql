SELECT m.pk_meter "Meter ID",
	ST_AsText(m.mline_location) "Coords",
	s.str_rates "Rate Card",
	s.dt_rates_as_of_date "Rate Timestamp"
FROM meter as m
JOIN segment as s USING (pk_meter)
WHERE s.str_rates LIKE '%$%'
AND m.pk_meter_status = 2
AND m.pk_city = '8fb67f46-7a52-11df-8236-4b82affbb4de'
AND m.pk_operator = 'b758e992-8fd7-4fd1-86df-03bc12916940';
