SELECT ROUND(CAST(COUNT(distinct lo.pk_lot) as decimal)/COUNT(distinct l.pk_lot)::numeric * 100, 2)
	"Percent of private lots with active data feed",
	COUNT(distinct lo.pk_lot) "Number of private lots with active data feed",
	COUNT(distinct l.pk_lot) "Total number of private lots"
FROM lot as l
LEFT JOIN lot_occupancy as lo USING (pk_lot) 
WHERE active_lot(l.pk_lot)
AND l.pk_city IN ('8f79d14a-7a52-11df-997e-ff1e99959de6', 
				  '16c2dea1-6fd5-4371-b274-a7e8bbac4fe2')
AND l.pk_operator NOT IN ('a94abb5c-cd79-11e2-bc2e-22000af8682a', 
						  '914edc76-ce1a-11e2-8ac0-22000afd0f6a');


SELECT distinct l.pk_lot "Lot ID", 
	lt.str_value "Lot Type",
	c.str_value "Lot Operator",
	COUNT(*) "Number of Data Feeds"
FROM lot as l
JOIN lot_occupancy as lo USING (pk_lot) 
LEFT JOIN lot_type as lt USING (pk_lot_type)
LEFT JOIN company as c ON (l.pk_operator = c.pk_company)
WHERE active_lot(l.pk_lot)
AND l.pk_city IN ('8f79d14a-7a52-11df-997e-ff1e99959de6', 
				  '16c2dea1-6fd5-4371-b274-a7e8bbac4fe2')
AND l.pk_operator NOT IN ('a94abb5c-cd79-11e2-bc2e-22000af8682a', 
						  '914edc76-ce1a-11e2-8ac0-22000afd0f6a')
GROUP BY 1, 2, 3;