SELECT bmw.str_name AS "City_Name",
	COALESCE(count(flags.pk_meter), 0) AS "Flagged_Blocks"
FROM (
	SELECT REGEXP_REPLACE(str_name, '(@.*|\s-.*)', '') AS str_name,
		pk_destination
	FROM destination
	WHERE i_onstreet_wave IN (1,2,3,4,5,11,12,13,15,16)) AS bmw
	LEFT JOIN (
		SELECT pk_meter, pk_city
		FROM meter
		WHERE (evaluation_timebins IS NOT NULL AND evaluation_timebins != '{}')
		) AS flags ON bmw.pk_destination = flags.pk_city
GROUP BY 1;


-- TIME BUCKETS

WITH bucket_a AS (
	SELECT pk_city, count(pk_meter) AS meter_count
	FROM meter
	WHERE evaluation_timebins::text LIKE '%\_A%'
	GROUP BY 1
),
bucket_b AS (
	SELECT pk_city, count(pk_meter) AS meter_count
	FROM meter
	WHERE evaluation_timebins::text LIKE '%\_B%'
	GROUP BY 1
),
bucket_c AS (
	SELECT pk_city, count(pk_meter) AS meter_count
	FROM meter
	WHERE evaluation_timebins::text LIKE '%\_C%'
	GROUP BY 1
),
bucket_d AS (
	SELECT pk_city, count(pk_meter) AS meter_count
	FROM meter
	WHERE evaluation_timebins::text LIKE '%\_D%'
	GROUP BY 1
),
bucket_e AS (
	SELECT pk_city, count(pk_meter) AS meter_count
	FROM meter
	WHERE evaluation_timebins::text LIKE '%\_E%'
	GROUP BY 1
),
bucket_f AS (
	SELECT pk_city, count(pk_meter) AS meter_count
	FROM meter
	WHERE evaluation_timebins::text LIKE '%\_F%'
	GROUP BY 1
),
bucket_g AS (
	SELECT pk_city, count(pk_meter) AS meter_count
	FROM meter
	WHERE evaluation_timebins::text LIKE '%\_G%'
	GROUP BY 1
),
bucket_h AS (
	SELECT pk_city, count(pk_meter) AS meter_count
	FROM meter
	WHERE evaluation_timebins::text LIKE '%\_H%'
	GROUP BY 1
)

(SELECT bmw.str_name AS "City_Name",
	'A' AS "Bucket",
	COALESCE(sum(flags.meter_count), 0) AS "Flagged_Blocks"
FROM (
	SELECT REGEXP_REPLACE(str_name, '(@.*|\s-.*)', '') AS str_name,
		pk_destination
	FROM destination
	WHERE i_onstreet_wave IN (1,2,3,4,5,11,12,13,15,16)) AS bmw
	LEFT JOIN (
		SELECT meter_count, 
			pk_city
		FROM bucket_a ) AS flags ON bmw.pk_destination = flags.pk_city
GROUP BY 1)

UNION ALL

(SELECT bmw.str_name AS "City_Name",
	'B' AS "Bucket",
	COALESCE(sum(flags.meter_count), 0) AS "Flagged_Blocks"
FROM (
	SELECT REGEXP_REPLACE(str_name, '(@.*|\s-.*)', '') AS str_name,
		pk_destination
	FROM destination
	WHERE i_onstreet_wave IN (1,2,3,4,5,11,12,13,15,16)) AS bmw
	LEFT JOIN (
		SELECT meter_count, 
			pk_city
		FROM bucket_b ) AS flags ON bmw.pk_destination = flags.pk_city
GROUP BY 1)

UNION ALL

(SELECT bmw.str_name AS "City_Name",
	'C' AS "Bucket",
	COALESCE(sum(flags.meter_count), 0) AS "Flagged_Blocks"
FROM (
	SELECT REGEXP_REPLACE(str_name, '(@.*|\s-.*)', '') AS str_name,
		pk_destination
	FROM destination
	WHERE i_onstreet_wave IN (1,2,3,4,5,11,12,13,15,16)) AS bmw
	LEFT JOIN (
		SELECT meter_count, 
			pk_city
		FROM bucket_c ) AS flags ON bmw.pk_destination = flags.pk_city
GROUP BY 1)

UNION ALL

(SELECT bmw.str_name AS "City_Name",
	'D' AS "Bucket",
	COALESCE(sum(flags.meter_count), 0) AS "Flagged_Blocks"
FROM (
	SELECT REGEXP_REPLACE(str_name, '(@.*|\s-.*)', '') AS str_name,
		pk_destination
	FROM destination
	WHERE i_onstreet_wave IN (1,2,3,4,5,11,12,13,15,16)) AS bmw
	LEFT JOIN (
		SELECT meter_count, 
			pk_city
		FROM bucket_d ) AS flags ON bmw.pk_destination = flags.pk_city
GROUP BY 1)

UNION ALL

(SELECT bmw.str_name AS "City_Name",
	'E' AS "Bucket",
	COALESCE(sum(flags.meter_count), 0) AS "Flagged_Blocks"
FROM (
	SELECT REGEXP_REPLACE(str_name, '(@.*|\s-.*)', '') AS str_name,
		pk_destination
	FROM destination
	WHERE i_onstreet_wave IN (1,2,3,4,5,11,12,13,15,16)) AS bmw
	LEFT JOIN (
		SELECT meter_count, 
			pk_city
		FROM bucket_e ) AS flags ON bmw.pk_destination = flags.pk_city
GROUP BY 1)

UNION ALL

(SELECT bmw.str_name AS "City_Name",
	'F' AS "Bucket",
	COALESCE(sum(flags.meter_count), 0) AS "Flagged_Blocks"
FROM (
	SELECT REGEXP_REPLACE(str_name, '(@.*|\s-.*)', '') AS str_name,
		pk_destination
	FROM destination
	WHERE i_onstreet_wave IN (1,2,3,4,5,11,12,13,15,16)) AS bmw
	LEFT JOIN (
		SELECT meter_count, 
			pk_city
		FROM bucket_f ) AS flags ON bmw.pk_destination = flags.pk_city
GROUP BY 1)

UNION ALL

(SELECT bmw.str_name AS "City_Name",
	'G' AS "Bucket",
	COALESCE(sum(flags.meter_count), 0) AS "Flagged_Blocks"
FROM (
	SELECT REGEXP_REPLACE(str_name, '(@.*|\s-.*)', '') AS str_name,
		pk_destination
	FROM destination
	WHERE i_onstreet_wave IN (1,2,3,4,5,11,12,13,15,16)) AS bmw
	LEFT JOIN (
		SELECT meter_count, 
			pk_city
		FROM bucket_g ) AS flags ON bmw.pk_destination = flags.pk_city
GROUP BY 1)

UNION ALL

(SELECT bmw.str_name AS "City_Name",
	'H' AS "Bucket",
	COALESCE(sum(flags.meter_count), 0) AS "Flagged_Blocks"
FROM (
	SELECT REGEXP_REPLACE(str_name, '(@.*|\s-.*)', '') AS str_name,
		pk_destination
	FROM destination
	WHERE i_onstreet_wave IN (1,2,3,4,5,11,12,13,15,16)) AS bmw
	LEFT JOIN (
		SELECT meter_count, 
			pk_city
		FROM bucket_h ) AS flags ON bmw.pk_destination = flags.pk_city
GROUP BY 1)

ORDER BY "City_Name", "Bucket"