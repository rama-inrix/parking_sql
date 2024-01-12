UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	str_website = 'https://www.parkindy.info/'
FROM segment
WHERE
	pk_city = '8f7e772c-7a52-11df-b6c0-f7b558d7dd5a'
	AND pk_meter_status = 2
	AND meter.pk_meter = segment.pk_meter
RETURNING meter.pk_meter, meter.pk_city, meter.str_website, 
meter.pk_user_modified, meter.dt_modified_date;