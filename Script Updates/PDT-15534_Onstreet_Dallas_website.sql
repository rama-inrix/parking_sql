UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	str_website = 'https://dallascityhall.com/departments/transportation/Pages/parking-management.aspx'
FROM segment
WHERE
	pk_city = '8f8c42e4-7a52-11df-be21-472335edca3d'
	AND pk_meter_status != 8
	AND meter.pk_meter = segment.pk_meter
RETURNING meter.pk_meter, meter.pk_city, meter.str_website, 
meter.pk_user_modified, meter.dt_modified_date;