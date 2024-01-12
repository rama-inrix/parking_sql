-- London
SELECT pk_meter
FROM meter
WHERE pk_city IN ('1df305f2-7d1a-49aa-9f66-2f486aa5f3c0', 
				  '9995dc69-b2bb-4a9b-98b6-51acd1a87bd3', 
				  '9887d39e-17f4-11e2-8f4c-12313d1b6657')
AND pk_meter_status = 2
ORDER BY RANDOM()
LIMIT 371;

-- Berlin
SELECT pk_meter
FROM meter
WHERE pk_city IN ('978148ea-17f4-11e2-a897-12313d1b6657')
AND pk_meter_status = 2
ORDER BY RANDOM()
LIMIT 367;
