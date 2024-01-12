SELECT d.str_name "City",
	l.pk_lot "Lot ID",
	ls.str_value "Lot Status",
	lt.str_value "Lot Type"
FROM lot as l
JOIN destination as d ON l.pk_city = d.pk_destination
JOIN lot_status as ls USING (pk_lot_status)
JOIN lot_type as lt USING (pk_lot_type)
WHERE pk_city IN ('9a6edf54-17f4-11e2-8b2a-12313d1b6657', --Turin
				  '8f991d52-7a52-11df-9e03-bbc37281c2f4', --Detroit
				  '9bb0fb5f-04c8-45ed-9154-654a362f64b4', '9840eb96-17f4-11e2-801f-12313d1b6657', --Paris
				  '9995dc69-b2bb-4a9b-98b6-51acd1a87bd3', '9887d39e-17f4-11e2-8f4c-12313d1b6657', --London
				  '978148ea-17f4-11e2-a897-12313d1b6657') --Berlin
AND l.pk_lot_status IN (6, 9);
