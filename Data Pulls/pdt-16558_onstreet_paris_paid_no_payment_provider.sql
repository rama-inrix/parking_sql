SELECT distinct m.pk_meter "Meter ID", 
ST_AsText(m.mline_location) "Meter Coordinates", 
s.dt_rates_as_of_date "Rate Timestamp"
FROM meter m JOIN segment s USING (pk_meter)
left join segment_company_payment scp using (pk_segment)
WHERE m.pk_city IN ('9840eb96-17f4-11e2-801f-12313d1b6657', '9bb0fb5f-04c8-45ed-9154-654a362f64b4', '991c7ee2-fcc0-444e-a26d-59f837e8f712')
AND s.str_rates LIKE '%€%'
AND scp.pk_segment IS NULL;
