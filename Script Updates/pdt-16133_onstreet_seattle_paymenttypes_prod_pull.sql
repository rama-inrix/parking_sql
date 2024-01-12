SELECT m.pk_meter
FROM meter AS m
	JOIN segment AS s USING (pk_meter)
WHERE
	m.pk_city IN ('8fb66ce0-7a52-11df-8bdf-bb1f4e1170cb', 
				  '2dd429b1-fdc3-4c32-80a5-462f1dd76fa7', 
				  'b2e87ed7-4655-4ae5-8953-02e45ae6a2dd')
	AND m.pk_operator = '1b5cab01-c753-4837-9a10-1cb437ead110'
	AND (s.str_rates LIKE '%$%' OR s.str_rates LIKE '%See Meter%')