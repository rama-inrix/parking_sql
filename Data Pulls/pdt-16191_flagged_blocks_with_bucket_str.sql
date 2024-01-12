SELECT bmw.str_name AS "City_Name",
	flags.pk_meter AS "Flagged_Block_ID",
	flags.evaluation_timebins AS "Buckets"
FROM (
	SELECT REGEXP_REPLACE(str_name, '(@.*|\s-.*)', '') AS str_name,
		pk_destination
	FROM destination
	WHERE i_onstreet_wave IN (1,2,3,4,5,11,12,13,15,16)) AS bmw
	JOIN (
		SELECT pk_meter, pk_city, evaluation_timebins
		FROM meter
		WHERE i_flag = 2
			AND evaluation_timebins IS NOT NULL
		) AS flags ON bmw.pk_destination = flags.pk_city
ORDER BY 1;