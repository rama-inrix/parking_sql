SELECT pk_lot AS "Lot_ID",
	str_gc_address AS "Navigation_Address",
	pk_user_modified AS "User_Modified",
	dt_modified_date AS "Date_Modified"
FROM lot 
WHERE str_gc_address LIKE '%?%'
	AND pk_lot_status = 6;

SELECT pk_lot AS "Lot_ID",
	str_gc_address AS "Navigation_Address",
	pk_user_modified AS "User_Modified",
	dt_modified_date AS "Date_Modified"
FROM lot 
WHERE str_gc_address LIKE '%!%'
	OR str_gc_address LIKE '%@%'
	OR str_gc_address LIKE '%$%'
	OR str_gc_address LIKE '%\%%' ESCAPE '\';