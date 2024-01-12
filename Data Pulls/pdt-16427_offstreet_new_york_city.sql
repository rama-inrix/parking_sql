SELECT l.pk_lot AS "Lot_ID", 
l.str_operator AS "Operator_Name",
l.pk_operator AS "Operator_ID",
ST_AsText(l.gpnt_location) AS "Lot_Coord",
d.str_name AS "City_Name"
FROM lot AS l
	JOIN destination AS d ON l.pk_city = d.pk_destination
WHERE l.pk_lot_status IN (6, 9) AND
l.pk_city IN ('8fa1d7a8-7a52-11df-b7ed-5b0c599fe066', 
			  '0725d895-fb7a-4920-a0bd-3ef05832cfb7', 
			  '907dff4c-76f5-4ce3-87d4-344b81372f3d')