CREATE TEMP TABLE seg_ids AS (
	SELECT distinct pk_segment
	FROM meter
	JOIN segment USING (pk_meter)
	WHERE meter.pk_meter_status = 2
	AND POSITION('Mon-Sat (09:00-19:00; Residential Permit Only; Sep-Jul): €2' IN str_rates) != 0
	AND meter.pk_city IN ('43132d03-5448-413c-bfee-89bf1c84c40e',
						  '98437348-17f4-11e2-ab33-12313d1b6657')
);

UPDATE segment
SET dt_modified_date = NOW(),
	str_rates = REPLACE(str_rates, 
						'Mon-Sat (09:00-19:00; Residential Permit Only; Sep-Jul): €2',
						'Mon-Sat (09:00-19:00; Sep-Jul; Residential Permit Only): €2')
WHERE pk_segment IN (SELECT * FROM seg_ids)
RETURNING pk_meter, pk_segment, str_rates, dt_modified_date;

UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW()
FROM segment
WHERE meter.pk_meter = segment.pk_meter
AND segment.pk_segment IN (SELECT * FROM seg_ids)
RETURNING meter.pk_meter, meter.pk_city, meter.pk_user_modified, meter.dt_modified_date;

