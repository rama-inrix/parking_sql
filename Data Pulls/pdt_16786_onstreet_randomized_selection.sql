SELECT m.pk_meter "Block ID"
FROM meter as m 
JOIN segment as s USING (pk_meter)
WHERE m.pk_city = '8f4de8fa-7a52-11df-a7f3-43212ff02681' --Montreal
AND m.pk_meter_status = 2
AND s.str_rates NOT LIKE '%Construction: No Parking%'
ORDER BY RANDOM()
LIMIT 338;

SELECT *
FROM (
	SELECT DISTINCT m.pk_meter "Block ID"
	FROM meter as m 
	WHERE m.pk_city IN ('9d39db76-17f4-11e2-9f63-12313d1b6657', 
						'1d78b976-c0e5-4493-b3d1-1957ac8f4bf7') --Bergen
	AND m.pk_meter_status = 2
	AND pk_meter NOT IN (SELECT pk_meter
						 FROM segment
						 WHERE str_rates LIKE '%Construction: No Parking%')
) distinct_meters
ORDER BY RANDOM()
LIMIT 301;

SELECT m.pk_meter "Block ID"
FROM meter as m 
JOIN segment as s USING (pk_meter)
WHERE m.pk_city IN ('94978eb4-3a98-4223-9e5d-8d63e429f393',
					'0725d895-fb7a-4920-a0bd-3ef05832cfb7',
					'907dff4c-76f5-4ce3-87d4-344b81372f3d',
					'8fa1d7a8-7a52-11df-b7ed-5b0c599fe066') --New York
AND m.pk_meter_status = 2
AND s.str_rates NOT LIKE '%Construction: No Parking%'
ORDER BY RANDOM()
LIMIT 376;

SELECT *
FROM (
	SELECT DISTINCT m.pk_meter "Block ID"
	FROM meter as m 
	WHERE m.pk_city = '8f8c84ca-7a52-11df-8d14-cf0f0660861b' --Fort Worth
	AND m.pk_meter_status = 2
	AND pk_meter NOT IN (SELECT pk_meter
						 FROM segment
						 WHERE str_rates LIKE '%Construction: No Parking%')
) distinct_meters
ORDER BY RANDOM()
LIMIT 199;

SELECT *
FROM (
	SELECT DISTINCT m.pk_meter "Block ID"
	FROM meter as m 
	WHERE m.pk_city = '9a72cf9c-17f4-11e2-8804-12313d1b6657' --Naples
	AND m.pk_meter_status = 2
	AND pk_meter NOT IN (SELECT pk_meter
						 FROM segment
						 WHERE str_rates LIKE '%Construction: No Parking%')
) distinct_meters
ORDER BY RANDOM()
LIMIT 321;
