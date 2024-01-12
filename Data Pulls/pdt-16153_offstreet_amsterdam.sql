SELECT pk_lot AS "Lot_ID", 
str_operator AS "Operator_Name",
pk_operator AS "Operator_ID",
ST_AsText(gpnt_location) AS "Lot_Coord"
FROM lot
WHERE pk_lot_status IN (6, 9) AND
pk_city IN ('9d37d6fa-17f4-11e2-b590-12313d1b6657', '5994843e-5d41-4a93-af2e-87f0141983df')