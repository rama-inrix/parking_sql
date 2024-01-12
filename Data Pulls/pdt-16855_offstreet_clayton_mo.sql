SELECT l.pk_lot "Lot ID",
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
	com.str_value "Operator",
	l.str_hrs_of_operation "Hrs of Operation",
	lds2.str_value "Hrs of Operation Source",
	l.dt_hrs_of_operation_as_of_date "Hrs of Operation Timestamp"
FROM lot as l
JOIN lot_status as ls USING (pk_lot_status)
JOIN lot_type as lt USING (pk_lot_type)
JOIN destination as d ON (l.pk_city = d.pk_destination)
LEFT JOIN company as com ON (l.pk_operator = com.pk_company)
LEFT JOIN lot_data_source as lds1 ON (l.pk_rates_source = lds1.pk_lot_data_source)
LEFT JOIN lot_data_source as lds2 ON (l.pk_hrs_of_operation_source = lds2.pk_lot_data_source)
WHERE pk_lot_status IN (6, 9)
AND l.pk_city = '8f835738-7a52-11df-86c8-335eb5195b04';
