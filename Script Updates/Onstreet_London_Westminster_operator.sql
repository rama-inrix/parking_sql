UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	pk_operator = '54c91bb2-445f-4082-b1b0-b3c50397dee3'
FROM segment
WHERE
	pk_city IN ('9887d39e-17f4-11e2-8f4c-12313d1b6657', '9995dc69-b2bb-4a9b-98b6-51acd1a87bd3')
	AND pk_meter_status = 2
	AND pk_operator = '87efa35e-c269-4e95-bec3-258de8246276'
	AND meter.pk_meter = segment.pk_meter
RETURNING meter.pk_meter, meter.pk_operator, meter.pk_city, meter.pk_user_modified, meter.dt_modified_date;