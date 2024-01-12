SELECT pk_lot "Lot ID",
	str_rates "Rate",
	str_hrs_of_operation "Hours of Operation",
	dt_modified_date "Date Modified",
	ST_AsText(gpnt_location) "Location"
FROM lot
WHERE pk_city = '5050030f-9891-4950-8e91-cbaf6287167a'
