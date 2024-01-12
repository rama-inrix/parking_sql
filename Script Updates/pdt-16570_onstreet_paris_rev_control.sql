UPDATE meter AS m
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	pk_meter_type = -1
FROM segment AS s
WHERE
	pk_city IN ('9840eb96-17f4-11e2-801f-12313d1b6657', 
				'9bb0fb5f-04c8-45ed-9154-654a362f64b4', 
				'991c7ee2-fcc0-444e-a26d-59f837e8f712')
	AND m.pk_meter_status = 2
	AND m.pk_operator = '5fabe71f-2513-463d-bc41-43fb0cb185dd'
	AND s.str_rates LIKE '%Loading Zone Commercial%'
	AND m.pk_meter_type = 4
	AND m.pk_meter = s.pk_meter
RETURNING m.pk_meter, m.pk_city, m.pk_meter_status, m.pk_operator, 
s.str_rates, m.pk_user_modified, m.dt_modified_date;
