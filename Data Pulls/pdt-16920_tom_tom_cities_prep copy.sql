-- Atlanta
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
WHERE pk_destination IN ('8f7c2288-7a52-11df-8a07-9b05f722855d',
						 '9c2584da-d5c7-4e1f-b675-0998dcc7b602');

-- Brussels
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
WHERE pk_destination IN ('90b2bd1e-17f4-11e2-9f58-12313d1b6657',
						 '58526140-c756-46a3-ae7b-6b8aa9601991');
						 
-- Charlotte
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
WHERE pk_destination IN ('8f855a92-7a52-11df-abf4-37f3ed537a28');

-- Frankfurt
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
WHERE pk_destination IN ('bcfca61c-f945-43ad-89ef-85d4055335da',
						 '975e579a-17f4-11e2-8115-12313d1b6657');

-- Jacksonville
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
WHERE pk_destination IN ('8f7922e0-7a52-11df-84ac-07f1e56b2a8d');

-- Las Vegas
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
WHERE pk_destination IN ('8fb18482-7a52-11df-92fa-53787a23f289');

-- Lyon
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
WHERE pk_destination IN ('98437348-17f4-11e2-ab33-12313d1b6657', 
						 '43132d03-5448-413c-bfee-89bf1c84c40e');

-- Miami Beach
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
WHERE pk_destination IN ('16c2dea1-6fd5-4371-b274-a7e8bbac4fe2', 
						 '8f79d14a-7a52-11df-997e-ff1e99959de6');

-- Milan
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
WHERE pk_destination IN ('9a739c92-17f4-11e2-b6a2-12313d1b6657');

-- San Antonio
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
WHERE pk_destination IN ('8f8e265e-7a52-11df-bb2d-5f15eb70ef83');

