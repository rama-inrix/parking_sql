UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	str_website = 'https://www.houstontx.gov/parking/'
FROM segment AS s
WHERE
	meter.pk_city = '8f8cdf10-7a52-11df-8045-3b9f4467140a'
	AND meter.pk_meter_status = 2
	AND meter.pk_operator = 'ad927000-0482-11e0-b8fe-123139143121'
	AND meter.pk_meter = s.pk_meter
RETURNING meter.pk_meter, meter.pk_city, meter.str_website,
meter.pk_user_modified, meter.dt_modified_date;

