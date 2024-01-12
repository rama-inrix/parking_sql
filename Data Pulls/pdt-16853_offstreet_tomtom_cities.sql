WITH cities AS (
	SELECT d.pk_destination
	FROM destination as d
	WHERE str_category = 'CITY'
	AND (d.str_name LIKE 'Amsterdam%' OR
		 d.str_name LIKE 'Barcelona%' OR
		 d.str_name LIKE 'Boston%' OR
		 d.str_name LIKE 'Miami%' OR
		 d.str_name LIKE 'Philadelphia%' OR
		 d.str_name LIKE 'Portland%' OR
		 d.str_name LIKE 'San Jose%' OR
		 d.str_name LIKE 'Seattle%' OR
		 d.str_name LIKE 'Vancouver%' OR
		 d.str_name LIKE 'Zurich%')
	AND i_onstreet_wave IS NOT NULL
	AND d.pk_destination NOT IN ('8f79d14a-7a52-11df-997e-ff1e99959de6', '16c2dea1-6fd5-4371-b274-a7e8bbac4fe2')
)
SELECT l.pk_lot "Meter ID",
	d.str_name "City",
	c.str_short_name "Country",
	ls.str_value "Lot Status",
	lt.str_value "Lot Type",
	ST_AsText(l.mpoly_lot) "Coords",
	l.str_rates "Rate Card",
	lds1.str_value "Rate Source",
	l.dt_rates_as_of_date "Rate Timestamp",
	l.b_cash_bill "Payment Type Bills",
	l.b_mc_visa "Payment Type MC/Visa",
	l.b_discover "Payment Type Discover",
	l.b_debit_card "Payment Type Debit",
	l.b_disc "Payment Type Disc",
	l.b_cash_coin "Payment Type Coins",
	l.b_amex "Payment Type AMEX",
	l.b_pay_by_phone "Payment Type Pay By Phone",
	l.b_apple_pay "Payment Type Apple Pay",
	l.b_check "Payment Type Check",
	lds2.str_value "Payment Types Source",
	l.dt_payment_method_as_of_date "Payment Types Timestamp",
	com.str_value "Operator",
	lds3.str_value "Operator Source",
	l.dt_operator_as_of_date "Operator Timestamp",
	l.str_hrs_of_operation "Hrs of Operation",
	lds4.str_value "Hrs of Operation Source",
	l.dt_hrs_of_operation_as_of_date "Hrs of Operation Timestamp",
	l.i_spaces "Spaces",
	lds5.str_value "Spaces Source",
	l.dt_spaces_as_of_date "Spaces Timestamp"
FROM lot as l
JOIN lot_status as ls USING (pk_lot_status)
JOIN lot_type as lt USING (pk_lot_type)
JOIN destination as d ON (l.pk_city = d.pk_destination)
JOIN country as c USING (pk_country)
JOIN company as com ON (l.pk_operator = com.pk_company)
JOIN lot_data_source as lds1 ON (l.pk_rates_source = lds1.pk_lot_data_source)
JOIN lot_data_source as lds2 ON (l.pk_payment_method_source = lds2.pk_lot_data_source)
JOIN lot_data_source as lds3 ON (l.pk_operator_source = lds3.pk_lot_data_source)
JOIN lot_data_source as lds4 ON (l.pk_hrs_of_operation_source = lds4.pk_lot_data_source)
JOIN lot_data_source as lds5 ON (l.pk_spaces_source = lds5.pk_lot_data_source)
AND l.pk_city IN (SELECT * FROM cities)
;
