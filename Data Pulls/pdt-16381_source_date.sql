SELECT l.pk_lot AS "Lot_ID", 
	d.str_name AS "City_Name",
	c.str_short_name AS "Country_Name",
	lds.str_value AS "Rates_Data_Source",
	l.dt_modified_date AS "Date_Modified",
	ls.str_value AS "Lot_Status"
FROM lot AS l
	JOIN destination AS d ON (l.pk_city = d.pk_destination)
	JOIN country AS c USING (pk_country)
	JOIN lot_data_source AS lds ON (l.pk_rates_source = lds.pk_lot_data_source)
	JOIN lot_status AS ls USING (pk_lot_status)
WHERE l.pk_lot_status IN (6, 9)
AND (   (l.pk_rates_source IN (4, 229)
		 AND '2020-11-3' <= l.dt_rates_as_of_date 
		 AND l.dt_rates_as_of_date <= '2021-7-31')
	 OR (pk_hrs_of_operation_source IN (4, 229)
		 AND '2020-11-3' <= l.dt_hrs_of_operation_as_of_date 
		 AND l.dt_hrs_of_operation_as_of_date <= '2021-7-31')
	 OR (pk_operator_source IN (4, 229)
		 AND '2020-11-3' <= l.dt_operator_as_of_date 
		 AND l.dt_operator_as_of_date <= '2021-7-31')
	 OR (pk_phone_source IN (4, 229)
		 AND '2020-11-3' <= l.dt_phone_as_of_date 
		 AND l.dt_phone_as_of_date <= '2021-7-31')
	 OR (pk_payment_method_source IN (4, 229)
		 AND '2020-11-3' <= l.dt_payment_method_as_of_date 
		 AND l.dt_payment_method_as_of_date <= '2021-7-31')
	);
