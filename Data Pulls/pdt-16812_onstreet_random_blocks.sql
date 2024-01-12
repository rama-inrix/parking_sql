-- Vancouver
SELECT *
FROM (
	SELECT distinct pk_meter
	FROM meter
	WHERE pk_city = '8f4ef4fc-7a52-11df-b6bf-5f39bd682706'
	AND pk_meter_status = 2
	AND pk_meter NOT IN (SELECT pk_meter
						 FROM segment
						 WHERE str_rates LIKE '%Construction: No Parking%')
) distinct_meters
ORDER BY RANDOM()
LIMIT 286;

-- Houston
SELECT *
FROM (
	SELECT distinct pk_meter
	FROM meter
	WHERE pk_city = '8f8cdf10-7a52-11df-8045-3b9f4467140a'
	AND pk_meter_status = 2
	AND pk_meter NOT IN (SELECT pk_meter
						 FROM segment
						 WHERE str_rates LIKE '%Construction: No Parking%')
) distinct_meters
ORDER BY RANDOM()
LIMIT 284;

-- Charlotte
SELECT *
FROM (
	SELECT distinct pk_meter
	FROM meter
	WHERE pk_city = '8f855a92-7a52-11df-abf4-37f3ed537a28'
	AND pk_meter_status = 2
	AND pk_meter NOT IN (SELECT pk_meter
						 FROM segment
						 WHERE str_rates LIKE '%Construction: No Parking%')
) distinct_meters
ORDER BY RANDOM()
LIMIT 206;

-- Jacksonville
SELECT *
FROM (
	SELECT distinct pk_meter
	FROM meter
	WHERE pk_city = '8f7922e0-7a52-11df-84ac-07f1e56b2a8d'
	AND pk_meter_status = 2
	AND pk_meter NOT IN (SELECT pk_meter
						 FROM segment
						 WHERE str_rates LIKE '%Construction: No Parking%')
) distinct_meters
ORDER BY RANDOM()
LIMIT 314;

-- Birmingham
SELECT *
FROM (
	SELECT distinct pk_meter
	FROM meter
	WHERE pk_city IN ('53011ec9-8ce0-4655-a188-26d3561c79fa',
					  '98a65ef4-17f4-11e2-8d2d-12313d1b6657') 
	AND pk_meter_status = 2
	AND pk_meter NOT IN (SELECT pk_meter
						 FROM segment
						 WHERE str_rates LIKE '%Construction: No Parking%')
) distinct_meters
ORDER BY RANDOM()
LIMIT 317;
