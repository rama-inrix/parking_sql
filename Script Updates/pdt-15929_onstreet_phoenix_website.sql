UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	str_website = 'https://www.phoenix.gov/streets/parking-meters'
FROM segment
WHERE
	pk_city IN ('8fa9dfde-7a52-11df-af59-273aa13aeea1', 'c4930b70-d1a2-4162-81ce-afef2d440454')
	AND pk_meter_status = 2 
	AND meter.pk_meter = segment.pk_meter
RETURNING meter.pk_meter, meter.pk_city, meter.str_website,
meter.pk_user_modified, meter.dt_modified_date;