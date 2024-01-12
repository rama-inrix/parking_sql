SELECT m.pk_meter "Meter ID",
	com.str_value "Operator",
	ST_AsText(m.mline_location) "PolyLine Coords",
	ST_AsText(m.gpnt_location) "MidPnt Coords",
	d.str_name "City",
	s.str_rates "Rate Card",
	s.dt_rates_as_of_date "Rate Timestamp",
	m.str_user_visible_note "UVN",
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
	mt.str_value "Revenue Control",
	c.str_value "Payment Provider",
	scp.str_id "Payment ID"
FROM meter as m
JOIN segment as s USING (pk_meter)
JOIN destination as d ON (m.pk_city = d.pk_destination)
JOIN company as com ON (m.pk_operator = com.pk_company)
JOIN meter_type as mt USING (pk_meter_type)
LEFT JOIN segment_company_payment as scp USING (pk_segment)
LEFT JOIN company as c ON scp.pk_company = c.pk_company
WHERE m.pk_city IN ('8fa1d7a8-7a52-11df-b7ed-5b0c599fe066',
					'94978eb4-3a98-4223-9e5d-8d63e429f393',
					'907dff4c-76f5-4ce3-87d4-344b81372f3d',
					'0725d895-fb7a-4920-a0bd-3ef05832cfb7')
AND m.pk_meter_status = 2
AND s.str_rates LIKE '%$%'
;
