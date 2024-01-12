UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	str_website = 'https://www.minneapolismn.gov/getting-around/parking-driving/'
FROM segment
WHERE
	pk_city = '8f9b5f5e-7a52-11df-804e-3fead1c408fb'
	AND pk_meter_status = 2
	AND meter.pk_meter = segment.pk_meter
RETURNING meter.pk_meter, meter.pk_city, meter.str_website, 
meter.pk_user_modified, meter.dt_modified_date;