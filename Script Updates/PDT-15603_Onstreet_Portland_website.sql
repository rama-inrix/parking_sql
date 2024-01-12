UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	str_website = 'https://www.portland.gov/transportation/parking/parking-guide'
FROM segment
WHERE
	pk_city = '8fb40c16-7a52-11df-bd91-93cdc8fa625d'
	AND pk_meter_status = 2
	AND meter.pk_meter = segment.pk_meter
RETURNING meter.pk_meter, meter.pk_city, meter.str_website, 
meter.pk_user_modified, meter.dt_modified_date;