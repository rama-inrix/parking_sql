--OFFSTREET
SELECT ST_AsText(mpoly_lot) AS "Lot Geometries"
FROM lot
WHERE active_lot(pk_lot);

--ONSTREET
SELECT ST_AsText(mline_location) AS "Meter Geometries"
FROM meter
WHERE pk_meter_status = 2;