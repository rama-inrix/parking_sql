SELECT m.pk_meter "Meter ID",
	ST_AsText(m.mline_location) "Meter Coordinates",
	s.str_rates "Rate Card",
	s.dt_rates_as_of_date "Rate Timestamp"
FROM meter as m 
JOIN segment as s using (pk_meter)
WHERE m.pk_city = '975ec626-17f4-11e2-9171-12313d1b6657'
AND s.str_rates LIKE '%€%'
AND m.pk_meter_status = 2
AND m.pk_operator = '9038b323-e7e3-40a8-90df-472a03500906';