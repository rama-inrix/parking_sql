SELECT m.dt_modified_date "Last Modified",
	m.pk_meter "Meter ID",
	s.str_rates "Rate Card",
	s.dt_rates_as_of_date "Rate Timestamp"
FROM meter as m
JOIN segment as s USING (pk_meter)
WHERE pk_meter_status = 2
AND s.str_rates LIKE '%€%'
AND m.pk_city = '978148ea-17f4-11e2-a897-12313d1b6657'
AND m.pk_operator = '2f97381d-5b12-40e2-9c1e-af0dfaa85df3';