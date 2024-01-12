UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	str_website = 'https://www.miamibeachfl.gov/city-hall/parking/'
FROM segment
WHERE
	pk_city = '8f79d14a-7a52-11df-997e-ff1e99959de6'
	AND pk_meter_status != 8
	AND meter.pk_meter = segment.pk_meter
RETURNING meter.pk_meter, meter.pk_city, meter.str_website, 
meter.pk_user_modified, meter.dt_modified_date;