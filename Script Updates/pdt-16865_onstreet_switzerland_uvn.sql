UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	str_user_visible_note = REPLACE(str_user_visible_note, 'CHF', 'Fr')
FROM destination AS d
WHERE meter.pk_city = d.pk_destination
AND meter.pk_meter_status = 2
AND d.pk_country = 'b3633366-ca10-11e1-a4d7-12313d1b6657'
AND str_user_visible_note LIKE '%CHF%'
RETURNING meter.pk_meter AS "Meter ID", 
	d.str_name AS "City", 
	d.pk_country AS "Country",
	meter.str_user_visible_note AS "New UVN",
	meter.pk_user_modified AS "User Modified", 
	meter.dt_modified_date AS "Date Modified";