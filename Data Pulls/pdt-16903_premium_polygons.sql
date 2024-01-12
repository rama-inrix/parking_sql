WITH merged_polygons AS (
	SELECT distinct 
		COALESCE(conflation_market_id, i_market_id) market_id,
		REGEXP_REPLACE(str_name, '(@.*|\s-.*)', '') city,
		mpoly_onstreet_merged premium_polygon
	FROM destination AS d
	WHERE mpoly_onstreet_merged IS NOT NULL
	AND mpoly_onstreet IS NOT NULL
	AND b_premium IS TRUE
	AND COALESCE(conflation_market_id, i_market_id) NOT IN (44, 266, 110)
),
premium_polygons AS ( 
	SELECT *
	FROM merged_polygons
	UNION (
		SELECT COALESCE(conflation_market_id, i_market_id) market_id,
			REGEXP_REPLACE(str_name, '(@.*|\s-.*)', '') city,
			ST_Union(mpoly_onstreet) premium_polygon
		FROM destination AS d
		WHERE COALESCE(conflation_market_id, i_market_id) NOT IN (SELECT mp."Market ID" 
																  FROM merged_polygons AS mp) 
		AND COALESCE(conflation_market_id, i_market_id) NOT IN (44, 266, 110)
		AND (d.str_name NOT LIKE '%@%'
			 OR (d.str_name SIMILAR TO '%@(1|2|3|4|5|11|12|13|15|16)'))
		AND mpoly_onstreet IS NOT NULL
		AND b_premium IS TRUE
		GROUP BY 1, 2)
)

UPDATE destination as d
SET dt_modified_date = NOW(),
	mpoly_onstreet_premium = pp.premium_polygon
FROM premium_polygons as pp
WHERE d.i_market_id = pp.market_id;
