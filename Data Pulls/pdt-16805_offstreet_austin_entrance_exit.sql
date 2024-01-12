(
SELECT distinct l.pk_lot "Lot ID",
	d.str_name "City",
	'POINT(' || SUBSTRING(SPLIT_PART(pep.str_point, ',', 1), 2) || ' ' || RTRIM(SPLIT_PART(pep.str_point, ',', 2), ']') || ')' "geometry",
	CASE
		WHEN pep.pk_pep_type = 1 THEN 'Entrance'
		WHEN pep.pk_pep_type = 2 THEN 'Exit'
        WHEN pep.pk_pep_type = 3 THEN 'Entrance/Exit'
    END "Type"
FROM lot AS l
JOIN destination AS d ON (l.pk_city = d.pk_destination)
JOIN pep USING (pk_lot)
WHERE l.pk_city IN ('942a0692-692f-4220-85d0-5851adfc171e',
				    '8f8b9146-7a52-11df-99e8-538d0503d72a',
					'8200c9e0-b5c6-4b35-baf2-ce4c68729993')
AND active_lot(l.pk_lot)
)
UNION
(
SELECT l.pk_lot "Lot ID",
	d.str_name "City",
	ST_AsText(l.mpoly_lot) "geometry",
	'Lot' "Type"
FROM lot AS l
JOIN destination AS d ON (l.pk_city = d.pk_destination)
WHERE l.pk_city IN ('942a0692-692f-4220-85d0-5851adfc171e',
				    '8f8b9146-7a52-11df-99e8-538d0503d72a',
					'8200c9e0-b5c6-4b35-baf2-ce4c68729993')
AND active_lot(l.pk_lot)
)
