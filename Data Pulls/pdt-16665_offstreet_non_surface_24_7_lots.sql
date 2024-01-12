SELECT l.pk_lot "Lot ID",
	l.str_hrs_of_operation "Hours of Operation",
	lds.str_value "Hours of Op Source",
	ls.str_value "Lot Status",
	lt.str_value "Lot Type",
	lc.str_value "Lot Category",
	lf.str_value "Lot Architecture"
FROM lot as l
JOIN lot_data_source as lds ON (l.pk_hrs_of_operation_source = lds.pk_lot_data_source)
JOIN lot_format as lf USING (pk_lot_format)
JOIN lot_status as ls USING (pk_lot_status)
JOIN lot_type as lt USING (pk_lot_type)
JOIN lot_category as lc USING (pk_lot_category)
WHERE l.str_hrs_of_operation = 'Mon-Sun: 24 Hours'
AND l.pk_hrs_of_operation_source = 229
AND l.pk_lot_format IN (3, 4)
AND l.pk_lot_status = 6
AND l.pk_lot_type != 10
AND l.pk_lot_category NOT IN (4, 9);
