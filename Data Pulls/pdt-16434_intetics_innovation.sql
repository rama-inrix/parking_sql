SELECT pk_destination AS "City_ID",
	str_name AS "City_Name",
	ST_AsText(mpoly_onstreet) AS "Polygon_Geom_WKT"
FROM destination
WHERE pk_destination IN ('8f991d52-7a52-11df-9e03-bbc37281c2f4', --Detroit
						 '9887d39e-17f4-11e2-8f4c-12313d1b6657', '9995dc69-b2bb-4a9b-98b6-51acd1a87bd3', --London
						 '978148ea-17f4-11e2-a897-12313d1b6657', --Berlin
						 '9840eb96-17f4-11e2-801f-12313d1b6657', '9bb0fb5f-04c8-45ed-9154-654a362f64b4', --Paris
						 '9a6edf54-17f4-11e2-8b2a-12313d1b6657'); --Turin

SELECT m.pk_meter AS "Meter_ID",
	ms.str_value AS "Meter_Status",
	m.str_name AS "Street_Name",
	m.from_cross_road AS "From_Cross_Road",
	m.to_cross_road AS "To_Cross_Road",
	REGEXP_REPLACE(d.str_name, '(@.*|\s-.*)', '') AS "City",
	ST_AsText(m.mline_location) AS "Linestring_Geom",
	ST_AsText(m.gpnt_location) AS "Centerpoint_Geom"
FROM meter AS m 
	JOIN destination AS d ON (m.pk_city = d.pk_destination)
	JOIN meter_status AS ms USING (pk_meter_status)
WHERE m.pk_city IN ('8f991d52-7a52-11df-9e03-bbc37281c2f4', --Detroit
					'9887d39e-17f4-11e2-8f4c-12313d1b6657', '9995dc69-b2bb-4a9b-98b6-51acd1a87bd3', --London
					'978148ea-17f4-11e2-a897-12313d1b6657', --Berlin
					'9840eb96-17f4-11e2-801f-12313d1b6657', '9bb0fb5f-04c8-45ed-9154-654a362f64b4', --Paris
					'9a6edf54-17f4-11e2-8b2a-12313d1b6657') --Turin
	AND m.pk_meter_status IN (2, 7);