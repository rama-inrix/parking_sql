SELECT m.pk_meter "Meter ID",
	d.str_name "City",
	c.str_short_name "Country",
	ST_AsText(m.mline_location) "Coords",
	s.str_rates "Rate Card",
	lds.str_value "Rate Source",
	s.dt_rates_as_of_date "Rate Timestamp",
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
	com.str_value "Operator"
FROM meter as m
JOIN segment as s USING (pk_meter)
JOIN destination as d ON (m.pk_city = d.pk_destination)
JOIN country as c USING (pk_country)
JOIN company as com ON (m.pk_operator = com.pk_company)
JOIN lot_data_source as lds ON (s.pk_rates_source = lds.pk_lot_data_source)
AND m.pk_city IN ('37e23981-3188-4a1d-a050-902dc27e2409', '8fb40c16-7a52-11df-bd91-93cdc8fa625d', --Portland
				  '8fb66ce0-7a52-11df-8bdf-bb1f4e1170cb', 'b2e87ed7-4655-4ae5-8953-02e45ae6a2dd', '2dd429b1-fdc3-4c32-80a5-462f1dd76fa7') --Seattle
;
