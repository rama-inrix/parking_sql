SELECT di.dt_create_date "Data Issue Create Date",
	auth_user.email "Collector",
	m.pk_meter "Meter ID", 
	concat(m.str_name, COALESCE(NULLIF(' From ' || m.from_cross_road || COALESCE(NULLIF(' To ' || m.to_cross_road,''),' To ' || m.from_cross_road),''), NULLIF(' From ' || m.to_cross_road || ' To ' || m.to_cross_road,''))) "Address",
	di.i_spaces_available "Spaces Available",
	di.i_probability_live "INRIX Probability Beta",
	di.f_lat "Lat",
	di.f_long "Long",
	ST_DistanceSphere(ST_SetSRID(ST_Point(di.f_long, di.f_lat), 4326), m.gpnt_location) "Distance",
	di.b_missing_data "Missing Data",
	di.b_incorrect_offset "Incorrect Offset",
	di.b_evaluation "Flagged Block",
	CASE WHEN (b_missing_data IS TRUE OR b_incorrect_offset IS TRUE OR
                (asset.str_description IS NOT NULL AND asset.str_description != '') OR
                (di.str_value IS NOT NULL AND di.str_value != '' AND di.str_value NOT LIKE '%%. Removing because updated data issue posted%%')) THEN
                    CASE WHEN data_issue_resolution.str_value = 'Resolved' THEN
                        'Resolved <a href="./?pkdataissue='||di.pk_data_issue||'&action=Unknown Resolution">Unknown</a>
                         <a href="./?pkdataissue='||di.pk_data_issue||'&action=False Positive">FalsePositive</a>
                         <a href="./?pkdataissue='||di.pk_data_issue||'&action=Unresolve">Unresolve</a>'
                        WHEN data_issue_resolution.str_value = 'Unknown Resolution' THEN
                        'Unknown Resolution <a href="./?pkdataissue='||di.pk_data_issue||'&action=Resolve">Resolve</a>
                         <a href="./?pkdataissue='||di.pk_data_issue||'&action=False Positive">FalsePositive</a>
                         <a href="./?pkdataissue='||di.pk_data_issue||'&action=Unresolve">Unresolve</a>'
                        WHEN data_issue_resolution.str_value = 'False Positive' THEN
                        'False Positive <a href="./?pkdataissue='||di.pk_data_issue||'&action=Resolve">Resolve</a>
                         <a href="./?pkdataissue='||di.pk_data_issue||'&action=Unknown Resolution">Unknown</a>
                         <a href="./?pkdataissue='||di.pk_data_issue||'&action=Unresolve">Unresolve</a>'
                        WHEN data_issue_resolution.str_value IS NULL THEN
                        'Unresolved <a href="./?pkdataissue='||di.pk_data_issue||'&action=Resolve">Resolve</a>
                         <a href="./?pkdataissue='||di.pk_data_issue||'&action=Unknown Resolution">Unknown</a>
                         <a href="./?pkdataissue='||di.pk_data_issue||'&action=False Positive">FalsePositive</a>'
                        ELSE 'failed checks' END
                    ELSE NULL END "Resolved",
	CASE WHEN asset.str_description = di.str_value
                    THEN asset.str_description
                    ELSE concat(asset.str_description, di.str_value)
                END "Description & Notes",
	'<img width="60px" src="https://%s/'||str_path_thumb||'" />' "Thumbnail",
	'<a href="./?pk_data_issue='||asset.pk_data_issue||'">Photos</a></td>' "Photos"
FROM data_issue as di
LEFT JOIN data_issue_resolution ON data_issue_resolution.pk_data_issue_resolution = di.pk_data_issue_resolution
LEFT JOIN django_lot.auth_user ON pk_user = id
JOIN meter as m USING (pk_meter)
JOIN destination as d ON m.pk_city = d.pk_destination
LEFT JOIN asset USING (pk_data_issue)
WHERE di.dt_create_date >= '2023-06-30'
AND d.pk_state = 'dadb9ba4-9d64-11e2-83de-22000af9498c'
AND di.f_lat >= 33.8;
