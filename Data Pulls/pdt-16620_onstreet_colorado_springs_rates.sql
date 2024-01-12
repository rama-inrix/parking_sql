SELECT m.pk_meter "Meter ID",
	s.str_rates "Rates",
	ST_AsText(m.mline_location) "Coordinates",
	s.dt_rates_as_of_date "Rate Timestamp"
FROM meter as m
JOIN segment as s USING (pk_meter)
WHERE s.str_rates LIKE '%$%'
AND m.pk_operator = 'e9c04759-ba8d-4796-95ce-83c97536112c'
AND m.pk_city = '8fb03cda-7a52-11df-8e29-0ff11f2ae509'
AND m.pk_meter_status = 2;
