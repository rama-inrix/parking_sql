SELECT m.pk_meter "Block ID",
	c.str_value "Operator Name",
	m.pk_operator "Operator ID",
	ST_AsText(m.gpnt_location) "Meter MidPnt",
	ST_AsText(m.mline_location) "Meter Polyline",
	d.str_name "City Name",
	m.str_website "Website",
	s.str_rates "Rates",
	s.dt_rates_as_of_date "Rates Timestamp",
	m.b_cash_bill "Payment Type Bills",
	m.b_mc_visa "Payment Type MC/Visa",
	m.b_discover "Payment Type Discover",
	m.b_debit_card "Payment Type Debit",
	m.b_disc "Payment Type Disc",
	m.b_cash_coin "Payment Type Coins",
	m.b_amex "Payment Type AMEX",
	m.b_pay_by_phone "Payment Type Pay By Phone",
	m.b_apple_pay "Payment Type Apple Pay",
	m.b_check "Payment Type Check",
	mt.str_value "Revenue Control"
FROM meter AS m
JOIN company AS c ON (m.pk_operator = c.pk_company)
JOIN destination AS d ON (m.pk_city = d.pk_destination)
JOIN segment AS s USING (pk_meter)
JOIN meter_type AS mt USING (pk_meter_type)
WHERE m.pk_operator = 'c9388b59-46ef-44e4-9d86-490600b18c07';
