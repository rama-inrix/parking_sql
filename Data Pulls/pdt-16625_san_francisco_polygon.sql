SELECT str_name "City", ST_AsText(mpoly_location) "Polygon"
FROM destination 
WHERE str_category = 'CITY' AND str_name LIKE 'San Francisco';