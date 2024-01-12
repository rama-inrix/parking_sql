SELECT m.pk_meter "Meter ID", 
	d.str_name "City", 
	c.str_short_name "Country", 
	s.pk_segment "Segment ID", 
	s.str_rates "Rate Card" 
FROM meter as m JOIN segment as s USING (pk_meter)
JOIN destination as d ON m.pk_city = d.pk_destination
JOIN country as c USING (pk_country)
WHERE s.str_rates LIKE '%ю%' OR s.str_rates LIKE '%Ю%';