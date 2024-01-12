UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	str_website = 'https://new.columbus.gov/Services/Parking-Street-Services/Parking-Services'
FROM segment
WHERE
	pk_city IN ('8f875842-7a52-11df-9a92-13dc5e4f3c47', '510e38e2-77d6-4dfb-98f9-57ff7acecdcc')
	AND pk_meter_status = 2
	AND pk_operator = '777692d8-e29e-11e2-82cc-22000af8682a'
	AND meter.pk_meter = segment.pk_meter
RETURNING meter.pk_meter, meter.pk_city, meter.str_website, 
meter.pk_user_modified, meter.dt_modified_date;
