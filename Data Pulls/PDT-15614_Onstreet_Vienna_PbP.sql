SELECT s.pk_segment AS "Segment_ID", 
	scp.pk_company AS "PbP_Provider_ID",
	c.str_value AS "PbP_Provider_Name",
	scp.str_id AS "PbP_ID"
FROM meter as m JOIN segment AS s USING (pk_meter) 
	LEFT JOIN segment_company_payment AS scp USING (pk_segment)
	JOIN company AS c USING (pk_company)
WHERE m.pk_city IN ('90532912-17f4-11e2-bf17-12313d1b6657', 'ff1130c6-b9ee-4a3d-97fc-3a06f288d053');