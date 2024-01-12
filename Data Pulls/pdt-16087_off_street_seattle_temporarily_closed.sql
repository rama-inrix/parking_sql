SELECT pk_lot AS "Lot_ID", 
str_operator AS "Operator_Name",
pk_operator AS "Operator_ID",
ST_AsText(gpnt_location) AS "Lot_Coord"
FROM lot
WHERE pk_lot_status = 9 AND
pk_city IN ('8fb66ce0-7a52-11df-8bdf-bb1f4e1170cb', 'b2e87ed7-4655-4ae5-8953-02e45ae6a2dd')