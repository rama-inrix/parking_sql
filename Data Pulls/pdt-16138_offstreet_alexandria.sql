SELECT pk_lot AS "Lot_ID", 
str_operator AS "Operator_Name",
pk_operator AS "Operator_ID",
ST_AsText(gpnt_location) AS "Lot_Coord"
FROM lot
WHERE pk_lot_status = 6 AND
pk_city = '8f8ed9b4-7a52-11df-a187-0f6873d34b4d'