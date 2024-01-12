BEGIN TRANSACTION;

UPDATE meter as m
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	str_user_visible_note = COALESCE(str_user_visible_note || ' ', '') || 'Providers for which ID is determined by geolocation:
	- Phonzie
	- DropTicket
	- ParkAppy
	- GTT - SostAPP
	- EasyPark
	- myCicero
	- PayByPhone
	- Telepass'
FROM segment as s 
WHERE m.pk_city = '9a6edf54-17f4-11e2-8b2a-12313d1b6657'
AND m.pk_meter_status = 2
AND s.str_rates LIKE '%€%'
AND m.pk_operator = '6d464534-c16a-11e1-8eb5-12313d1b6657'
AND m.pk_meter = s.pk_meter
RETURNING m.pk_meter, m.str_user_visible_note, 
m.pk_user_modified, m.dt_modified_date;

COMMIT;