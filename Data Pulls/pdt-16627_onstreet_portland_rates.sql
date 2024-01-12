SELECT m.pk_meter "Meter ID",
	s.str_rates "Rates",
	scp.str_id "Payment ID",
	ST_AsText(m.mline_location) "Coordinates"
FROM meter as m
JOIN segment as s USING (pk_meter)
LEFT JOIN segment_company_payment as scp USING (pk_segment)
WHERE s.str_rates LIKE '%$%'
AND m.pk_operator = 'e91c3b7e-b993-4511-8b60-b60c5da6b753'
AND m.pk_city IN ('8fb40c16-7a52-11df-bd91-93cdc8fa625d', '37e23981-3188-4a1d-a050-902dc27e2409');
