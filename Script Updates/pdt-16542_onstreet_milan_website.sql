UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	str_website = 'https://www.atm.it/it/AltriServizi/Auto/Pagine/SostaStrada.aspx'
FROM segment
WHERE
	pk_city = '9a739c92-17f4-11e2-b6a2-12313d1b6657'
	AND meter.pk_meter_status = 2
	AND meter.pk_operator = 'd568675d-6fc8-4838-b22d-1ff5a2c8bbfe'
	AND meter.pk_meter = segment.pk_meter
RETURNING meter.pk_meter, meter.pk_city, meter.pk_operator, 
meter.str_website, meter.pk_user_modified, meter.dt_modified_date;