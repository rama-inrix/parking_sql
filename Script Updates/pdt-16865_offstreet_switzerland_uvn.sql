UPDATE lot
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	str_user_visible_note = REPLACE(str_user_visible_note, 'CHF', 'Fr')
FROM destination AS d
WHERE lot.pk_city = d.pk_destination
AND active_lot(pk_lot)
AND d.pk_country = 'b3633366-ca10-11e1-a4d7-12313d1b6657'
AND str_user_visible_note LIKE '%CHF%'
RETURNING lot.pk_lot AS "Lot ID", 
	d.str_name AS "City", 
	d.pk_country AS "Country",
	lot.str_user_visible_note AS "New UVN",
	lot.pk_user_modified AS "User Modified", 
	lot.dt_modified_date AS "Date Modified";