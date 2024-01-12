SELECT di.dt_create_date "DateTime",
	auth_user.email "Collector",
	l.pk_lot "Lot ID", 
	l.str_gc_address "Address",
	di.f_lat "Lat",
	di.f_long "Long",
	lt.str_value "Restricted",
	CASE WHEN asset.str_description = di.str_value
                    THEN asset.str_description
                    ELSE concat(asset.str_description, di.str_value)
                END "Description & Notes",
	'<a href="./?pk_data_issue='||asset.pk_data_issue||'">Photos</a></td>' "Photos"
FROM data_issue as di
LEFT JOIN django_lot.auth_user ON pk_user = id
JOIN lot as l USING (pk_lot)
LEFT JOIN asset USING (pk_data_issue)
JOIN lot_type as lt USING (pk_lot_type)
WHERE l.pk_city = '978148ea-17f4-11e2-a897-12313d1b6657'
AND di.dt_create_date >= '2023-07-01';