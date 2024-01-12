UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	str_website = 'http://www.serviziallastrada.it/it/'
FROM segment
WHERE
	pk_city = '9a772fba-17f4-11e2-9b1b-12313d1b6657'
	AND pk_meter_status = 2
	AND meter.pk_meter = segment.pk_meter
RETURNING meter.pk_meter, meter.pk_city, meter.str_website, 
meter.pk_user_modified, meter.dt_modified_date;