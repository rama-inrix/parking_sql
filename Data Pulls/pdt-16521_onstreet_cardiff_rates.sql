SELECT m.pk_meter AS "Meter ID",
	ST_AsText(m.mline_location) AS "Meter Coordinates",
	s.str_rates AS "Segment Rate Card",
	s.dt_rates_as_of_date AS "Rate Timestamp"
FROM meter m JOIN segment s USING (pk_meter)
WHERE m.pk_meter_status = 2
	AND s.str_rates LIKE '%£%'
	AND m.pk_operator = 'e2529816-50d5-48f6-b098-223007da0d47'
	AND m.pk_city = '98a269d4-17f4-11e2-a36f-12313d1b6657';