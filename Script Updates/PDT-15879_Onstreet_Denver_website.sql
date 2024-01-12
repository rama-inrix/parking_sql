UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	str_website = 'https://www.denvergov.org/Government/Agencies-Departments-Offices/Agencies-Departments-Offices-Directory/Parking-Division/Street-Parking'
FROM segment
WHERE
	pk_city = '8fb0459a-7a52-11df-8cbf-37a45bc10013'
	AND pk_operator = '115554b4-6cac-48e1-998d-6cc6a14b6271'
	AND pk_meter_status = 2
	AND meter.pk_meter = segment.pk_meter
RETURNING meter.pk_meter, meter.pk_city, meter.pk_operator, meter.str_website, 
meter.pk_user_modified, meter.dt_modified_date;