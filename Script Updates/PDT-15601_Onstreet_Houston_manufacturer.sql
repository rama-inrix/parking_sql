UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	pk_manufacturer = 3
FROM segment
WHERE
	pk_city = '8f8cdf10-7a52-11df-8045-3b9f4467140a'
	AND pk_meter_type = 6
	AND meter.pk_meter = segment.pk_meter
RETURNING meter.pk_meter, meter.pk_city, meter.pk_manufacturer, meter.pk_meter_type,
meter.pk_user_modified, meter.dt_modified_date;