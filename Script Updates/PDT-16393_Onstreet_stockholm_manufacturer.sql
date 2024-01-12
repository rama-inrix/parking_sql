UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	pk_manufacturer = 2
FROM segment AS s
WHERE
	pk_city IN ('9e73edba-17f4-11e2-b79c-12313d1b6657', '29a91409-1aad-42d3-b35d-7d3ba85b5d97')
	AND s.str_rates LIKE '% kr%'
	AND meter.pk_meter = s.pk_meter
RETURNING meter.pk_meter, meter.pk_city, meter.pk_manufacturer,
meter.pk_user_modified, meter.dt_modified_date;