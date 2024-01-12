UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	pk_manufacturer = 22
FROM segment
WHERE
	pk_city = '8f9b5f5e-7a52-11df-804e-3fead1c408fb'
	AND pk_meter_type = 5
	AND meter.pk_meter = segment.pk_meter
RETURNING meter.pk_meter, meter.pk_city, meter.pk_manufacturer, meter.pk_meter_type,
meter.pk_user_modified, meter.dt_modified_date;