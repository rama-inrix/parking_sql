SELECT
    str_iso_3166 "Country",
	COUNT(distinct destination.pk_destination) AS "City Count",
    COUNT(*) "Active Lot Count"
FROM lot
JOIN destination ON lot.pk_city = destination.pk_destination
JOIN country USING (pk_country) 
WHERE active_lot(pk_lot) AND str_iso_3166 != 'CN'
GROUP BY 1 ORDER BY 1;

SELECT
    str_iso_3166 "Country",
	COUNT(distinct destination.pk_destination) AS "City Count",
    COUNT(*) "POI Count"
FROM meter
JOIN destination ON meter.pk_city = destination.pk_destination
JOIN country USING (pk_country) 
WHERE pk_meter_status = 2 AND str_iso_3166 != 'CN'
GROUP BY 1 ORDER BY 1;