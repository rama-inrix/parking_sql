SELECT l.pk_lot AS "Lot ID",
	ST_AsText(l.gpnt_location) AS "Coords",
	l.str_gc_address AS "Address",
	COALESCE(c.str_value, l.str_operator) "Operator",
	CASE WHEN lo.pk_lot IS NOT NULL THEN 'Yes' ELSE 'No' END "Live API Connection"
FROM lot as l 
LEFT JOIN lot_occupancy as lo USING (pk_lot)
LEFT JOIN company as c ON l.pk_operator = c.pk_company
WHERE l.pk_city IN ('8f7c2288-7a52-11df-8a07-9b05f722855d',
					'9c2584da-d5c7-4e1f-b675-0998dcc7b602')
AND active_lot(l.pk_lot); 

