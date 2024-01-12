UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	str_website = 'https://charlottenc.gov/Transportation/Pages/default.aspx'
FROM segment
WHERE
	pk_city = '8f855a92-7a52-11df-abf4-37f3ed537a28'
	AND pk_meter_status = 2 
	AND meter.pk_meter = segment.pk_meter
RETURNING meter.pk_meter, meter.pk_city, meter.str_website,
meter.pk_user_modified, meter.dt_modified_date;