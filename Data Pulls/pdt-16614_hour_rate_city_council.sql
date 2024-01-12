BEGIN TRANSACTION;

-- Block 1: Create tmp table with city names and pks for each city
CREATE TEMP TABLE tmp_cities AS                                     
WITH city_ids (pk_city, city_name) AS (VALUES
									   ('8f815fb4-7a52-11df-ab56-d75affece362', 'Baltimore'),
									   ('8faaa3f6-7a52-11df-a935-8b8cacd4d9eb', 'Berkeley'),
									   ('8f95d02a-7a52-11df-ba0e-8fbef256f7a4', 'Boston'),
									   ('89ab869e-ddfd-46fc-9ea5-6a332c7f60d7', 'Boston'),
									   ('3cf48f2b-500c-4684-a747-3341022138ac', 'Boston'),
									   ('8fa01864-7a52-11df-86b4-3f2c1c734f6d', 'Buffalo'),
									   ('ade049c6-7823-46ba-936d-7e3b8520168a', 'Cambridge'),
									   ('8f95e02e-7a52-11df-a2c1-b739ee17e5a3', 'Cambridge'),
									   ('1bf2184a-a731-4de6-bad6-c5f851fcd43b', 'Chicago'),
									   ('8f92634a-7a52-11df-89e0-c7c2b13caea7', 'Chicago'),
									   ('629198f0-8083-4f2f-b3e8-5c311a343769', 'Chicago'),
									   ('8f8cdf10-7a52-11df-8045-3b9f4467140a', 'Houston'),
									   ('8fad3788-7a52-11df-b1f4-831a189ffe88', 'Long Beach'),
									   ('d73a18ee-0286-41fc-9c18-39e26f520a6f', 'Long Beach'),
									   ('8fad40fc-7a52-11df-bee9-93ec9d1defb1', 'Los Angeles'),
									   ('4cb2dd45-c39e-43a5-a0f0-b194c0fc8f85', 'Los Angeles'),
									   ('7dda1d0e-2384-48b6-bc86-6f8fe1e2f6ff', 'Los Angeles'),
									   ('1fd51bf4-00ce-47be-aa67-28c5ee94e6ea', 'Los Angeles'),
									   ('ebea3111-e08d-45ca-a1f7-506e208f729b', 'Los Angeles'),
									   ('5fdd68d0-9498-4e5d-beef-6b12894dd3f4', 'Los Angeles'),
									   ('04557b80-41db-48fb-97e2-e3ec8d9be554', 'Los Angeles'),
									   ('8f80d9d6-7a52-11df-bc99-573e77b96e27', 'New Orleans'),
									   ('907dff4c-76f5-4ce3-87d4-344b81372f3d', 'New York'),
									   ('0725d895-fb7a-4920-a0bd-3ef05832cfb7', 'New York'),
									   ('8fa1d7a8-7a52-11df-b7ed-5b0c599fe066', 'New York'),
									   ('94978eb4-3a98-4223-9e5d-8d63e429f393', 'New York'),
									   ('8fae0ed8-7a52-11df-b6ac-c33827de5a34', 'Palo Alto'),
									   ('8fae17a2-7a52-11df-b523-03bb5fff6999', 'Pasadena'),
									   ('e59c4b07-c00b-4348-86fa-1b9011fde267', 'Philadelphia'),
									   ('31d6c1da-e84c-4db0-9dcf-cc276a336057', 'Philadelphia'),
									   ('8f8935cc-7a52-11df-85ef-037cba85cd49', 'Philadelphia'),
									   ('37e23981-3188-4a1d-a050-902dc27e2409', 'Portland'),
									   ('8fb40c16-7a52-11df-bd91-93cdc8fa625d', 'Portland'),
									   ('eb61e711-2b8f-4db2-bf41-69776b28e34b', 'San Diego'),
									   ('8fae9e8e-7a52-11df-9eaf-4bc75e197fae', 'San Diego'),
									   ('bb4d7a68-c2b9-428b-bf8e-ab1d7909f70e', 'San Diego'),
									   ('948eb4c7-2f14-483a-b56d-8a40893b88ca', 'San Francisco'),
									   ('8faea5fa-7a52-11df-a6b1-17291a90f79e', 'San Francisco'),
									   ('9259f5d4-3ec2-4ba1-8edc-00c3f80f1a34', 'San Francisco'),
									   ('8faeded0-7a52-11df-924e-67118850e639', 'Santa Barbara'),
									   ('8faeea56-7a52-11df-ad8f-6b84bf453d3d', 'Santa Monica'),
									   ('2dd429b1-fdc3-4c32-80a5-462f1dd76fa7', 'Seattle'),
									   ('8fb66ce0-7a52-11df-8bdf-bb1f4e1170cb', 'Seattle'),
									   ('b2e87ed7-4655-4ae5-8953-02e45ae6a2dd', 'Seattle'))
SELECT * FROM city_ids;

-- Block 2: Create tmp table with city name and City Hall entrance coordinates
CREATE TEMP TABLE tmp_city_hall AS                                     
WITH council_coords (city_name, lat, long) AS (VALUES
											   ('Baltimore', 39.290913, -76.6104142), 
											   ('Berkeley', 37.8695016, -122.27052),
											   ('Boston', 42.3613807, -71.0576749),
											   ('Buffalo', 42.886477, -78.8787793),
											   ('Cambridge', 42.366835, -71.1060263),
											   ('Chicago', 41.8838195, -87.6322528),
											   ('Houston', 29.760361, -95.3688143),
											   ('Long Beach', 33.7680518, -118.1976691),
											   ('Los Angeles', 34.0539733, -118.2432646),
											   ('New Orleans', 29.9525092, -90.0766478),
											   ('New York', 40.7121308, -74.0056558),
											   ('Palo Alto', 37.4444893, -122.1602469),
											   ('Pasadena', 34.1476556, -118.1429702),
											   ('Philadelphia', 39.9530363, -75.1635027),
											   ('Portland', 45.5149534, -122.6787188),
											   ('San Diego', 32.7168379, -117.1629266),
											   ('San Francisco', 37.7792066, -122.4185349),
											   ('Santa Barbara', 34.4201446, -119.6987385),
											   ('Santa Monica', 34.0118531, -118.4915483),
											   ('Seattle', 47.6040228, -122.3295819))
SELECT * FROM council_coords;

-- Block 3: ONSTREET Create CTE with minimum distances to city hall entrance, and use it to query for the meter in question.
WITH min_dist AS (
SELECT c.city_name, MIN(ST_DistanceSphere(ST_SetSRID(ST_Point(h.long, h.lat), 4326), m.gpnt_location)) "min_dist"
FROM meter AS m
JOIN segment AS s USING (pk_meter)
JOIN tmp_cities AS c USING (pk_city)
JOIN tmp_city_hall AS h USING (city_name)
WHERE (s.str_rates LIKE '%Free%' OR s.str_rates LIKE '%$%')
AND m.pk_meter_status = 2
AND m.pk_meter NOT IN (22501989, 179000286, 55500977, 46500080, 58000335, 53001028, 
					   53001035, 22501968, 139000568, 179000273, 55500973, 53000983, 
					   139000561, 179000349, 55503927, 179000348, 55500975, 179000350)
GROUP BY c.city_name)

SELECT c.city_name "City", 
	m.pk_meter "Meter ID", 
	s.str_rates "Rate Card", 
	md.min_dist "Distance to City Hall (in meters)"
FROM meter as m 
JOIN segment as s USING (pk_meter)
JOIN tmp_cities as c USING (pk_city)
JOIN tmp_city_hall AS h USING (city_name)
JOIN min_dist as md ON (md.min_dist = ST_DistanceSphere(ST_SetSRID(ST_Point(h.long, h.lat), 4326), m.gpnt_location)
					   and md.city_name = c.city_name)
WHERE s.str_rates != 'No Parking' AND s.str_rates != 'Bus Stop: No Parking';

-- Block 4: OFFSTREET Create CTE with minimum distances to city hall entrance, and use it to query for the lot in question.
WITH min_dist AS (
SELECT c.city_name, MIN(ST_DistanceSphere(ST_SetSRID(ST_Point(h.long, h.lat), 4326), l.gpnt_location)) "min_dist"
FROM lot AS l
JOIN tmp_cities AS c USING (pk_city)
JOIN tmp_city_hall AS h USING (city_name)
WHERE (l.str_rates LIKE '%Free%' OR l.str_rates LIKE '%$%')
AND l.pk_lot_type IN (2, 3, 11)
AND active_lot(l.pk_lot)
AND l.pk_lot NOT IN (85067, 38339, 24138, 78730, 390089, 116173, 213832, 91486, 343421, 78793, 391972, 91473)
GROUP BY c.city_name)

SELECT c.city_name "City", 
	l.pk_lot "Lot ID", 
	lt.str_value "Lot Type", 
	l.str_rates "Rate Card", 
	md.min_dist "Distance to City Hall (in meters)"
FROM lot as l 
JOIN lot_type as lt USING (pk_lot_type)
JOIN tmp_cities as c USING (pk_city)
JOIN tmp_city_hall AS h USING (city_name)
JOIN min_dist as md ON (md.min_dist = ST_DistanceSphere(ST_SetSRID(ST_Point(h.long, h.lat), 4326), l.gpnt_location)
					   and md.city_name = c.city_name);

--CAMBRIDGE METERS
SELECT m.pk_meter "Meter ID", 
	s.str_rates "Rate Card",
	ROW_NUMBER() OVER (PARTITION BY c.city_name ORDER BY ST_DistanceSphere(ST_SetSRID(ST_Point(h.long, h.lat), 4326), m.gpnt_location) ASC) AS row_num,
	ST_DistanceSphere(ST_SetSRID(ST_Point(h.long, h.lat), 4326), m.gpnt_location) "Distance to City Hall (in meters)"
FROM meter AS m
JOIN segment AS s USING (pk_meter)
JOIN tmp_cities AS c USING (pk_city)
JOIN tmp_city_hall AS h USING (city_name)
WHERE c.city_name = 'Cambridge'
AND (s.str_rates LIKE '%Free%' OR s.str_rates LIKE '%$%')
AND m.pk_meter_status = 2
AND m.pk_meter NOT IN (22501989, 179000286, 55500977, 46500080, 58000335, 53001028, 
					   53001035, 22501968, 139000568, 179000273, 55500973, 53000983, 
					   139000561, 179000349, 55503927, 179000348, 55500975, 179000350)

ROLLBACK;
