UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	pk_operator = 'ad958fc4-0482-11e0-94bc-123139143121'
FROM segment
WHERE
	pk_city = '8f7c2288-7a52-11df-8a07-9b05f722855d'
	AND pk_meter_status = 2
	AND pk_operator = '6a12a3ef-b12f-46eb-9f68-8d653abc8e89'
	AND meter.pk_meter = segment.pk_meter
RETURNING meter.pk_meter, meter.pk_city, meter.pk_operator, meter.pk_user_modified, 
meter.dt_modified_date;