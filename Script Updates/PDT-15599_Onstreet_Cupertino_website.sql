UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	str_website = 'https://www.cupertino.org/online-services/parking'
FROM segment
WHERE
	pk_city = '8fab6f34-7a52-11df-8be3-1bfba70d1ef7'
	AND pk_meter_status = 2
	AND meter.pk_meter = segment.pk_meter
RETURNING meter.pk_meter, meter.pk_city, meter.str_website, 
meter.pk_user_modified, meter.dt_modified_date;