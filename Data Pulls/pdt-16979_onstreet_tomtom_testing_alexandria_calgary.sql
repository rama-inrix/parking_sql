SELECT m.pk_meter "Meter ID",
	ms.str_value "Meter Status",
	d.str_name "City",
	c.str_short_name "Country",
	ST_AsText(m.mline_location) "PolyLine Coords",
	ST_AsText(m.gpnt_location) "MidPt Coords",
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
JOIN meter_status as ms USING (pk_meter_status)
JOIN segment as s USING (pk_meter)
JOIN destination as d ON (m.pk_city = d.pk_destination)
JOIN country as c USING (pk_country)
JOIN company as com ON (m.pk_operator = com.pk_company)
JOIN lot_data_source as lds ON (s.pk_rates_source = lds.pk_lot_data_source)
WHERE pk_destination IN ('8f8ed9b4-7a52-11df-a187-0f6873d34b4d', -- Alexandria
						 '8f4d0d72-7a52-11df-b17b-b732324da004') -- Calgary
;