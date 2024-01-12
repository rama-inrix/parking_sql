UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	str_website = 'https://www.amsterdam.nl/parkeren'
FROM segment AS s
WHERE
	meter.pk_city IN ('5994843e-5d41-4a93-af2e-87f0141983df',
					  '9d37d6fa-17f4-11e2-b590-12313d1b6657')
	AND meter.pk_meter_status = 2
	AND meter.pk_operator = '2f02925d-1394-4c73-b4a2-017090b5ac4b'
	AND meter.pk_meter = s.pk_meter
RETURNING meter.pk_meter, meter.pk_city, meter.str_website,
meter.pk_user_modified, meter.dt_modified_date;

