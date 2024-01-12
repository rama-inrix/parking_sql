SELECT s.pk_meter AS "Meter_ID",
ST_AsText(s.s_line_location) AS "Seg_Coord",
s.str_rates AS "Rate_Card",
scp.str_id AS "Payment_ID",
s.dt_rates_as_of_date AS "Rate_Timestamp"
FROM meter AS m 
JOIN segment AS s USING (pk_meter)
JOIN segment_company_payment AS scp USING (pk_segment)
WHERE m.pk_city IN ('9e73edba-17f4-11e2-b79c-12313d1b6657', '29a91409-1aad-42d3-b35d-7d3ba85b5d97')
AND s.str_rates LIKE '% kr%';