SELECT pk_meter as "Block ID"
FROM meter
WHERE pk_city = '9a6edf54-17f4-11e2-8b2a-12313d1b6657' --Turin
AND pk_meter_status = 2
ORDER BY RANDOM()
LIMIT 323;

SELECT pk_meter as "Block ID"
FROM meter
WHERE pk_city = '8f991d52-7a52-11df-9e03-bbc37281c2f4' --Detroit
AND pk_meter_status = 2
ORDER BY RANDOM()
LIMIT 324;

SELECT pk_meter as "Block ID"
FROM meter
WHERE pk_city IN ('9840eb96-17f4-11e2-801f-12313d1b6657', '9bb0fb5f-04c8-45ed-9154-654a362f64b4') --Paris
AND pk_meter_status = 2
ORDER BY RANDOM()
LIMIT 372;
