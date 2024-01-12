SELECT m.pk_meter "Meter ID",
	s.pk_segment "Segment ID",
	s.str_rates "Rate Card",
	c.str_value "Payment Provider",
	scp.str_id "Payment ID",
	ST_AsText(m.mline_location) "Coordinates",
	s.dt_rates_as_of_date "Rate Timestamp"
FROM meter as m
JOIN segment as s USING (pk_meter)
JOIN segment_company_payment as scp USING (pk_segment)
JOIN company as c USING (pk_company)
WHERE m.pk_meter_status = 2 
AND m.pk_city IN ('90532912-17f4-11e2-bf17-12313d1b6657', 'ff1130c6-b9ee-4a3d-97fc-3a06f288d053')
AND m.pk_operator = '5e3166a8-cf79-4db0-b8ca-3142b9e07011'
AND s.str_rates LIKE '%€%';

