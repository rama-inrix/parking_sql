SELECT c.str_continent_code AS "Continent",
	c.str_short_name AS "Country",
	l.pk_lot AS "Lot ID",
	ls.str_value AS "Lot Status",
	lc.str_value AS "Lot Category",
	l.str_modified_who AS "Last Modified Who",
	l.dt_modified_date AS "Last Modified Date"
FROM lot AS l
JOIN destination AS d ON l.pk_city = d.pk_destination
JOIN country AS c USING (pk_country)
JOIN lot_status AS ls USING (pk_lot_status)
JOIN lot_category AS lc USING (pk_lot_category)
WHERE l.pk_lot_status IN (6, 9)
AND l.pk_lot_type = 2
AND (l.str_operator IS NULL and l.pk_operator IS NULL)
AND l.str_rates = 'Mon-Sun: Free'
AND l.pk_lot_category IN (-1, 5);

SELECT d.str_name AS "City",
	m.pk_meter AS "Meter ID",
	c.str_value AS "Operator",
	ms.str_value AS "Meter Status",
	m.str_modified_who AS "Last Modified Who",
	m.dt_modified_date AS "Last Modified Date",
	ST_AsText(m.gpnt_location) AS "Mid Point",
	ST_AsText(m.mline_location) AS "Polyline"
FROM meter AS m
JOIN destination AS d ON m.pk_city = d.pk_destination
JOIN company AS c ON m.pk_operator = c.pk_company
JOIN meter_status AS ms USING (pk_meter_status)
WHERE d.pk_destination IN ('9841b12a-17f4-11e2-8ea9-12313d1b6657', '434925cb-55f1-46c0-9f72-27506b12ec3f');
