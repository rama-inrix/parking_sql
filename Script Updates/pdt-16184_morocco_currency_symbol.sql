WITH modlots AS (
	UPDATE country AS c
	SET str_currency_symbol = 'DH',
		dt_modified_date = NOW()
	FROM lot AS l
		JOIN destination AS d ON d.pk_destination = l.pk_city
	WHERE
		c.pk_country = 'b3619420-ca10-11e1-b2fb-12313d1b6657'
		AND c.pk_country = d.pk_country
	RETURNING l.pk_lot, c.pk_country, c.dt_modified_date
)

UPDATE lot AS l
SET pk_user_modified = 660973,
	dt_modified_date = NOW()
FROM modlots
WHERE modlots.pk_lot = l.pk_lot
RETURNING l.pk_lot, modlots.pk_country, l.pk_user_modified, l.dt_modified_date;