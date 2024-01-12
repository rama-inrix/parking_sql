UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	str_website = 'https://www.coj.net/departments/office-of-public-parking'
FROM segment
WHERE
	pk_city = '8f7922e0-7a52-11df-84ac-07f1e56b2a8d'
	AND pk_meter_status != 8
	AND meter.pk_meter = segment.pk_meter
RETURNING meter.pk_meter, meter.pk_city, meter.str_website, 
meter.pk_user_modified, meter.dt_modified_date;