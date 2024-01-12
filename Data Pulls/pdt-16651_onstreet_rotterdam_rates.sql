SELECT m.pk_meter "Meter ID",
	s.str_rates "Rate Card",
	ST_AsText(m.mline_location) "Meter Coords",
	s.dt_rates_as_of_date "Rate Timestamp"
FROM meter as m JOIN segment as s USING (pk_meter)
WHERE s.str_rates LIKE '%€%'
AND m.pk_meter_status = 2
AND m.pk_city IN ('3c5b1a7b-900b-4799-9c71-d539f496d755', '9d340b88-17f4-11e2-bd3b-12313d1b6657')
AND m.pk_operator = '3c8d0922-e429-406b-8532-e996862208e1';