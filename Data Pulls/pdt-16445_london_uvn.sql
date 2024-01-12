SELECT m.pk_meter AS "Block ID",
	ST_ASText(m.mline_location) AS "Coordinates",
	m.str_user_visible_note AS "UVN"
FROM meter AS m JOIN segment AS s USING (pk_meter)
WHERE m.pk_city IN ('9887d39e-17f4-11e2-8f4c-12313d1b6657', '9995dc69-b2bb-4a9b-98b6-51acd1a87bd3')
AND pk_operator = '54c91bb2-445f-4082-b1b0-b3c50397dee3'
AND s.str_rates LIKE '%£%';