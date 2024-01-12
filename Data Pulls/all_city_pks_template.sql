select pk_destination, str_name, str_category, pk_country, pk_state from destination 
where str_name LIKE 'San Jose%'
	AND str_category = 'CITY'