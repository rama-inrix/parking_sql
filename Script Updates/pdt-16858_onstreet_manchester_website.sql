UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	str_website = 'https://www.manchester.gov.uk/info/500346/city_centre_parking/146/on-street_parking'
FROM segment AS s
WHERE
	meter.pk_city IN ('98870dba-17f4-11e2-a1fa-12313d1b6657', '1ae8541a-9ac2-4c47-8676-29ea325789c9')
	AND meter.pk_meter_status = 2
	AND meter.pk_operator = 'eaa6f2db-3354-4776-b3a5-35df48f64d77'
	AND meter.pk_meter = s.pk_meter
RETURNING meter.pk_meter, meter.pk_city, meter.str_website,
meter.pk_user_modified, meter.dt_modified_date;