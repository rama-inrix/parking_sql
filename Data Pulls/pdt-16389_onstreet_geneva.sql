SELECT s.pk_segment AS "segment_ID",
s.pk_meter AS "Meter_ID", 
s.str_rates AS "Rate_Card",
CASE
    WHEN s.str_rates ~* '^no parking$' THEN 'YES'
    ELSE 'NO'
  END AS no_parking,
CASE
    WHEN s.str_rates ~* 'residential' THEN 'YES'
    ELSE 'NO'
  END AS residential,
CASE
    WHEN s.str_rates ~* 'disabled' THEN 'YES'
    ELSE 'NO'
  END AS disabled_permit,
CASE
    WHEN s.str_rates ~* 'electric' THEN 'YES'
    ELSE 'NO'
  END AS electric_vehicle,
CASE
    WHEN s.str_rates ~* 'loading zone' THEN 'YES'
    ELSE 'NO'
  END AS loading_zone,
CASE
    WHEN s.str_rates ~* 'taxis' THEN 'YES'
    ELSE 'NO'
  END AS taxis,
CASE
    WHEN s.str_rates ~* 'busses' THEN 'YES'
    ELSE 'NO'
  END AS busses_only,
CASE
    WHEN s.str_rates ~* 'bus stop' THEN 'YES'
    ELSE 'NO'
  END AS bus_stop,
CASE
    WHEN s.str_rates ~* 'car share' THEN 'YES'
    ELSE 'NO'
  END AS car_share,
CASE
    WHEN s.str_rates ~* 'carpool' THEN 'YES'
    ELSE 'NO'
  END AS carpool_only,
CASE
    WHEN s.str_rates ~* 'government' THEN 'YES'
    ELSE 'NO'
  END AS government_only,
CASE
    WHEN s.str_rates ~* 'fire department' THEN 'YES'
    ELSE 'NO'
  END AS fire_department_only,
CASE
    WHEN s.str_rates ~* 'press' THEN 'YES'
    ELSE 'NO'
  END AS media_press_only,
CASE
    WHEN s.str_rates ~* 'patrons' THEN 'YES'
    ELSE 'NO'
  END AS patrons_only,
CASE
    WHEN s.str_rates ~* 'valet' THEN 'YES'
    ELSE 'NO'
  END AS valet_only,
CASE
    WHEN s.str_rates ~* 'private' THEN 'YES'
    ELSE 'NO'
  END AS private,
CASE
    WHEN s.str_rates ~* 'university' THEN 'YES'
    ELSE 'NO'
  END AS university_permit_only,
CASE
    WHEN s.str_rates ~* 'for-hire' THEN 'YES'
    ELSE 'NO'
  END AS for_hire,
CASE
    WHEN s.str_rates ~* 'commercial vehicle' THEN 'YES'
    ELSE 'NO'
  END AS commercial_only,
s.dt_modified_date AS "Date_Modified",
ST_AsText(s.s_line_location) AS "Seg_Coord"
FROM meter AS m 
JOIN segment AS s USING (pk_meter)
WHERE m.pk_meter_status = 2 AND
m.pk_city = '925cf26a-17f4-11e2-b45e-12313d1b6657';