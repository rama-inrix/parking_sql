SELECT
    di.dt_create_date "Timestamp",
	au.email "Collector",
    di.pk_lot "LotID",
    lot.str_legal_address "Legal Address",
    lot.str_gc_address "Nav Address",
    di.f_lat "Lat",
    di.f_long "Lon",
    lot_type.str_value "Lot Type",
    di.str_value "Notes",
    CONCAT(asset.str_bucket, '/', asset.str_path) "Photo"
FROM data_issue di
JOIN django_lot.auth_user au ON au.id = di.pk_user
JOIN lot USING (pk_lot)
JOIN lot_type USING (pk_lot_type)
LEFT JOIN asset ON di.pk_data_issue = asset.pk_data_issue
WHERE di.pk_lot IS NOT NULL
	AND di.dt_create_date BETWEEN '2023-02-20 11:59:59' AND '2023-02-24 00:00:01';