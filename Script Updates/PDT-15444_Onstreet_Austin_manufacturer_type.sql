UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	pk_meter_type = 6,
	pk_manufacturer = 8
FROM segment
WHERE
	pk_operator = '4a516a30-aa1f-11e0-925b-12313d0151a1'
	AND pk_meter_status != 8 
	AND meter.pk_meter = segment.pk_meter
RETURNING meter.pk_meter, meter.pk_operator, meter.str_website,
meter.pk_user_modified, meter.dt_modified_date;