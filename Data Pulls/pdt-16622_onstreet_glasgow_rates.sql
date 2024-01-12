SELECT m.pk_meter "Meter ID",
	s.str_rates "Rates",
	ST_AsText(m.mline_location) "Coordinates",
	s.dt_rates_as_of_date "Rate Timestamp"
FROM meter as m
JOIN segment as s USING (pk_meter)
WHERE s.str_rates LIKE '%£%'
AND m.pk_operator = 'e1e39e63-d71c-444f-a09a-6df022ae44d4'
AND m.pk_city IN ('015a871d-9b5c-4caa-9e6e-5e566e548f5c', 
				  '988d675a-17f4-11e2-8252-12313d1b6657')
AND m.pk_meter_status = 2;
