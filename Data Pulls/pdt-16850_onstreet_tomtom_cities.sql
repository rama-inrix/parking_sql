WITH cities AS (
	SELECT d.pk_destination
	FROM destination as d 
	JOIN country as c USING (pk_country)
	LEFT JOIN state as s USING (pk_state)
	WHERE str_category = 'CITY'
	AND d.i_onstreet_wave NOT IN (30, -30)
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
	AND d.pk_destination NOT IN ('8f79d14a-7a52-11df-997e-ff1e99959de6')
)
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
AND m.pk_city IN (SELECT * FROM cities)
;


