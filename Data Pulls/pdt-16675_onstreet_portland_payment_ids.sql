SELECT m.pk_meter "Meter ID",
	s.pk_segment "Segment ID",
	scp.str_id "Payment ID",
	ST_AsText(m.mline_location) "Meter Coords"
FROM meter as m 
JOIN segment as s USING (pk_meter)
JOIN segment_company_payment as scp USING (pk_segment)
WHERE s.str_rates LIKE '%$%'
AND m.pk_meter_status = 2
AND m.pk_city IN ('37e23981-3188-4a1d-a050-902dc27e2409', '8fb40c16-7a52-11df-bd91-93cdc8fa625d');
