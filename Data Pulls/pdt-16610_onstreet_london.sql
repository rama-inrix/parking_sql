SELECT m.pk_meter AS "Block ID",
	c.str_value AS "Operator",
	ST_AsText(m.mline_location) AS "Meter Polyline",
	ST_AsText(m.gpnt_location) AS "Meter MidPoint",
	d.str_name AS "City",
	s.str_rates AS "Rates",
	s.dt_rates_as_of_date AS "Rates Timestamp",
	m.str_user_visible_note AS "UVN",
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
	c2.str_value AS "Payment Provider",
	scp.str_id AS "Payment ID"
FROM meter as m 
JOIN company as c ON m.pk_operator = c.pk_company
JOIN destination as d ON m.pk_city = d.pk_destination
JOIN segment as s USING (pk_meter)
JOIN meter_type as mt USING (pk_meter_type)
LEFT JOIN segment_company_payment as scp USING (pk_segment)
LEFT JOIN company as c2 ON scp.pk_company = c2.pk_company
WHERE m.pk_city IN ('9995dc69-b2bb-4a9b-98b6-51acd1a87bd3', '9887d39e-17f4-11e2-8f4c-12313d1b6657')
AND m.pk_meter_status = 2
AND s.str_rates LIKE '%£%';
