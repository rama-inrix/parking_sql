UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	str_website = 'https://detroitmi.gov/departments/municipal-parking-department'
FROM segment
WHERE
	pk_city = '8f991d52-7a52-11df-9e03-bbc37281c2f4'
	AND pk_meter_status = 2
	AND pk_operator = 'f3c710ae-d22e-11e2-ada0-22000afd0f6a'
	AND meter.pk_meter = segment.pk_meter
RETURNING meter.pk_meter, meter.pk_city, meter.str_website, 
meter.pk_operator, meter.pk_user_modified, meter.dt_modified_date;