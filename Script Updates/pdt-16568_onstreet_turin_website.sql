UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	str_website = 'http://www.comune.torino.it/trasporti/parcheggi/index.shtml'
FROM segment
WHERE
	pk_city = '9a6edf54-17f4-11e2-8b2a-12313d1b6657'
	AND pk_meter_status = 2
	AND pk_operator = '6d464534-c16a-11e1-8eb5-12313d1b6657'
	AND meter.pk_meter = segment.pk_meter
RETURNING meter.pk_meter, meter.pk_city, meter.str_website, 
meter.pk_user_modified, meter.dt_modified_date;