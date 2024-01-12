UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	str_website = 'http://www.ora-valencia.es/web/'
FROM segment
WHERE
	pk_city = '97d4eb6c-17f4-11e2-b796-12313d1b6657'
	AND pk_meter_status != 8 
	AND meter.pk_meter = segment.pk_meter
RETURNING meter.pk_meter, meter.pk_city, meter.str_website,
meter.pk_user_modified, meter.dt_modified_date;