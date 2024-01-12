SELECT m.pk_meter "Meter ID",
	ms.str_value "Meter Status",
	c.str_value "Operator",
	m.mline_location "Meter Polyline",
	m.gpnt_location "Meter Mid-point",
	d.str_name "City Name",
	m.str_website "Website",
	s.str_rates "Rates",
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
	mt.str_value "Revenue Control"
FROM meter as m 
JOIN meter_status as ms USING (pk_meter_status)
JOIN company as c ON m.pk_operator = c.pk_company
JOIN destination as d ON m.pk_city = d.pk_destination
JOIN segment as s USING (pk_meter)
JOIN meter_type as mt USING (pk_meter_type)
WHERE m.pk_meter_status != 7
AND m.pk_city IN ('8f991d52-7a52-11df-9e03-bbc37281c2f4', --Detroit
				  '9995dc69-b2bb-4a9b-98b6-51acd1a87bd3', '9887d39e-17f4-11e2-8f4c-12313d1b6657', --London 
				  '978148ea-17f4-11e2-a897-12313d1b6657', --Berlin
				  '9bb0fb5f-04c8-45ed-9154-654a362f64b4', '9840eb96-17f4-11e2-801f-12313d1b6657'); --Paris