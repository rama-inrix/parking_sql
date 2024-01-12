SELECT ST_AsText(m.mline_location) "Coords", 
	m.str_name "Street Name", 
	m.pk_meter "Meter ID", 
	m.pk_city "City ID", 
	m.dt_create_date "Date Created", 
	m.dt_modified_date "Date Modified", 
	m.str_modified_who "Who Modified", 
	d.i_onstreet_wave "City Wave", 
	d.str_name "City Name"
FROM meter as m JOIN destination as d ON m.pk_city = d.pk_destination
WHERE pk_city IN ('37e23981-3188-4a1d-a050-902dc27e2409', '8fb40c16-7a52-11df-bd91-93cdc8fa625d')
ORDER BY RANDOM()
LIMIT 200;

