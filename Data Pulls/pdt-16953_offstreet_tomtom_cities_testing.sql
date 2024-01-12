SELECT l.pk_lot "Lot ID",
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
LEFT JOIN company as com ON (l.pk_operator = com.pk_company)
LEFT JOIN lot_data_source as lds1 ON (l.pk_rates_source = lds1.pk_lot_data_source)
LEFT JOIN lot_data_source as lds2 ON (l.pk_payment_method_source = lds2.pk_lot_data_source)
LEFT JOIN lot_data_source as lds3 ON (l.pk_operator_source = lds3.pk_lot_data_source)
LEFT JOIN lot_data_source as lds4 ON (l.pk_hrs_of_operation_source = lds4.pk_lot_data_source)
LEFT JOIN lot_data_source as lds5 ON (l.pk_spaces_source = lds5.pk_lot_data_source)
WHERE l.pk_city IN ('89ab869e-ddfd-46fc-9ea5-6a332c7f60d7', 
					'8f95d02a-7a52-11df-ba0e-8fbef256f7a4', 
					'3cf48f2b-500c-4684-a747-3341022138ac', --Boston
					'31d6c1da-e84c-4db0-9dcf-cc276a336057', 
					'8f8935cc-7a52-11df-85ef-037cba85cd49', 
					'e59c4b07-c00b-4348-86fa-1b9011fde267', --Philadelphia 
					'8f855a92-7a52-11df-abf4-37f3ed537a28', --Charlotte
					'925c8140-17f4-11e2-8044-12313d1b6657') --Zurich
AND CASE WHEN d.pk_country = 'b363bb38-ca10-11e1-9278-12313d1b6657' THEN l.str_rates LIKE '%$%'
		  ELSE (l.str_rates ~ '\d+ Fr' OR l.str_rates ~ '\d+ CHF') END
AND pk_lot_status IN (6, 9)
ORDER BY 3, 2
;

