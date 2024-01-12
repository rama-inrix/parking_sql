UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	str_website = 'https://www.alexandriava.gov/Parking'
FROM segment
WHERE
	pk_city = '8f8ed9b4-7a52-11df-a187-0f6873d34b4d'
	AND pk_meter_status = 2 
	AND meter.pk_meter = segment.pk_meter
RETURNING meter.pk_meter, meter.pk_city, meter.str_website,
meter.pk_user_modified, meter.dt_modified_date;