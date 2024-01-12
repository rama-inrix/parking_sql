SELECT l.pk_lot AS "Lot_ID", 
ls.str_value AS "Lot_Status",
l.str_rates AS "Rate_Card",
l.str_hrs_of_operation AS "Operation_Hours",
l.dt_modified_date AS "Date_Modified",
ST_AsText(l.gpnt_location) AS "Lot_Coord"
FROM lot AS l
	LEFT JOIN lot_status AS ls USING (pk_lot_status) 
WHERE pk_city IN ('5f73e31a-2746-4898-8d81-5e254b071a53', 'dc6fa85b-068d-4e1f-9110-751ffd14df28', '8faeab9a-7a52-11df-afd6-7337b723a87f')