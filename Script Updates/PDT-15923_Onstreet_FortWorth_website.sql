UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	str_website = 'https://www.fortworthtexas.gov/departments/tpw/parking'
FROM segment
WHERE
	pk_city = '8f8c84ca-7a52-11df-8d14-cf0f0660861b'
	AND pk_meter_status != 8 
	AND meter.pk_meter = segment.pk_meter
RETURNING meter.pk_meter, meter.pk_city, meter.str_website,
meter.pk_user_modified, meter.dt_modified_date;