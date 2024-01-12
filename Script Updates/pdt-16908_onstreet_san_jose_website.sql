UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	str_website = 'https://www.sanjoseca.gov/your-government/departments-offices/transportation/parking'
FROM segment
WHERE
	pk_city IN ('5f73e31a-2746-4898-8d81-5e254b071a53',
				'dc6fa85b-068d-4e1f-9110-751ffd14df28',
				'8faeab9a-7a52-11df-afd6-7337b723a87f')
	AND pk_meter_status = 2
	AND pk_operator = '92abe09a-82d5-11e2-a2c4-22000af86439'
	AND meter.pk_meter = segment.pk_meter
RETURNING meter.pk_meter, meter.pk_city, meter.str_website, 
meter.pk_user_modified, meter.dt_modified_date;
