-- Las Vegas
SELECT *
FROM (
	SELECT distinct pk_meter "Meter ID",
		gpnt_location "Meter MidPt",
		mline_location "Meter Polyline"
	FROM meter
	WHERE pk_city = '8fb18482-7a52-11df-92fa-53787a23f289'
	AND pk_meter_status = 2
	AND pk_meter NOT IN (SELECT pk_meter
						 FROM segment
						 WHERE str_rates LIKE '%Construction: No Parking%')
) distinct_meters
ORDER BY RANDOM()
LIMIT 191;

-- Barcelona
SELECT *
FROM (
	SELECT distinct pk_meter "Meter ID",
		gpnt_location "Meter MidPt",
		mline_location "Meter Polyline"
	FROM meter
	WHERE pk_city = '98049344-17f4-11e2-baa1-12313d1b6657'
	AND pk_meter_status = 2
	AND pk_meter NOT IN (SELECT pk_meter
						 FROM segment
						 WHERE str_rates LIKE '%Construction: No Parking%')
) distinct_meters
ORDER BY RANDOM()
LIMIT 333;

-- Boston
SELECT *
FROM (
	SELECT distinct pk_meter "Meter ID",
		gpnt_location "Meter MidPt",
		mline_location "Meter Polyline"
	FROM meter
	WHERE pk_city IN ('3cf48f2b-500c-4684-a747-3341022138ac',
					  '8f95d02a-7a52-11df-ba0e-8fbef256f7a4',
					  '89ab869e-ddfd-46fc-9ea5-6a332c7f60d7')
	AND pk_meter_status = 2
	AND pk_meter NOT IN (SELECT pk_meter
						 FROM segment
						 WHERE str_rates LIKE '%Construction: No Parking%')
) distinct_meters
ORDER BY RANDOM()
LIMIT 337;

-- Houston
SELECT *
FROM (
	SELECT distinct pk_meter "Meter ID",
		gpnt_location "Meter MidPt",
		mline_location "Meter Polyline"
	FROM meter
	WHERE pk_city = '8f8cdf10-7a52-11df-8045-3b9f4467140a'
	AND pk_meter_status = 2
	AND pk_meter NOT IN (SELECT pk_meter
						 FROM segment
						 WHERE str_rates LIKE '%Construction: No Parking%')
) distinct_meters
ORDER BY RANDOM()
LIMIT 284;

-- Miami
SELECT *
FROM (
	SELECT distinct pk_meter "Meter ID",
		gpnt_location "Meter MidPt",
		mline_location "Meter Polyline"
	FROM meter
	WHERE pk_city IN ('8a203a04-d48c-4260-bc9c-e884a1eaee99',
					  '8f79cf74-7a52-11df-ab07-738613b18514',
					  '8164209b-7caa-48a5-befc-3a31c515362a')
	AND pk_meter_status = 2
	AND pk_meter NOT IN (SELECT pk_meter
						 FROM segment
						 WHERE str_rates LIKE '%Construction: No Parking%')
) distinct_meters
ORDER BY RANDOM()
LIMIT 303;

-- Philadelphia
SELECT *
FROM (
	SELECT distinct pk_meter "Meter ID",
		gpnt_location "Meter MidPt",
		mline_location "Meter Polyline"
	FROM meter
	WHERE pk_city IN ('e59c4b07-c00b-4348-86fa-1b9011fde267',
					  '8f8935cc-7a52-11df-85ef-037cba85cd49',
					  '31d6c1da-e84c-4db0-9dcf-cc276a336057')
	AND pk_meter_status = 2
	AND pk_meter NOT IN (SELECT pk_meter
						 FROM segment
						 WHERE str_rates LIKE '%Construction: No Parking%')
) distinct_meters
ORDER BY RANDOM()
LIMIT 350;

-- Charlotte
SELECT *
FROM (
	SELECT distinct pk_meter "Meter ID",
		gpnt_location "Meter MidPt",
		mline_location "Meter Polyline"
	FROM meter
	WHERE pk_city = '8f855a92-7a52-11df-abf4-37f3ed537a28'
	AND pk_meter_status = 2
	AND pk_meter NOT IN (SELECT pk_meter
						 FROM segment
						 WHERE str_rates LIKE '%Construction: No Parking%')
) distinct_meters
ORDER BY RANDOM()
LIMIT 206;

-- San Jose
SELECT *
FROM (
	SELECT distinct pk_meter "Meter ID",
		gpnt_location "Meter MidPt",
		mline_location "Meter Polyline"
	FROM meter
	WHERE pk_city IN ('8faeab9a-7a52-11df-afd6-7337b723a87f',
					  'dc6fa85b-068d-4e1f-9110-751ffd14df28',
					  '5f73e31a-2746-4898-8d81-5e254b071a53')
	AND pk_meter_status = 2
	AND pk_meter NOT IN (SELECT pk_meter
						 FROM segment
						 WHERE str_rates LIKE '%Construction: No Parking%')
) distinct_meters
ORDER BY RANDOM()
LIMIT 334;

-- Vancouver
SELECT *
FROM (
	SELECT distinct pk_meter "Meter ID",
		gpnt_location "Meter MidPt",
		mline_location "Meter Polyline"
	FROM meter
	WHERE pk_city = '8f4ef4fc-7a52-11df-b6bf-5f39bd682706'
	AND pk_meter_status = 2
	AND pk_meter NOT IN (SELECT pk_meter
						 FROM segment
						 WHERE str_rates LIKE '%Construction: No Parking%')
) distinct_meters
ORDER BY RANDOM()
LIMIT 286;

-- Zurich
SELECT *
FROM (
	SELECT distinct pk_meter "Meter ID",
		gpnt_location "Meter MidPt",
		mline_location "Meter Polyline"
	FROM meter
	WHERE pk_city = '925c8140-17f4-11e2-8044-12313d1b6657'
	AND pk_meter_status = 2
	AND pk_meter NOT IN (SELECT pk_meter
						 FROM segment
						 WHERE str_rates LIKE '%Construction: No Parking%')
) distinct_meters
ORDER BY RANDOM()
LIMIT 317;

