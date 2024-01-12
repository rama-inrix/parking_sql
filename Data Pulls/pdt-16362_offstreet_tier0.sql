SELECT l.pk_lot AS "Lot_ID", 
l.str_operator AS "Operator_Name",
l.pk_operator AS "Operator_ID",
ST_AsText(l.gpnt_location) AS "Lot_Coord",
d.str_name AS "City_Name"
FROM lot AS l
	JOIN destination AS d ON l.pk_city = d.pk_destination
WHERE l.pk_lot_status IN (6, 9) AND
l.pk_city IN ('8f991d52-7a52-11df-9e03-bbc37281c2f4', -- Detroit
			 '9887d39e-17f4-11e2-8f4c-12313d1b6657', '9995dc69-b2bb-4a9b-98b6-51acd1a87bd3', -- London
			 '978148ea-17f4-11e2-a897-12313d1b6657', -- Berlin
			 '9840eb96-17f4-11e2-801f-12313d1b6657', '9bb0fb5f-04c8-45ed-9154-654a362f64b4', -- Paris
			 '9a6edf54-17f4-11e2-8b2a-12313d1b6657') -- Turin