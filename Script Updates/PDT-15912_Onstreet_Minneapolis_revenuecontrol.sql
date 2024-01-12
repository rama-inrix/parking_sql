UPDATE meter AS m
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	pk_meter_type = 5
FROM segment AS s
WHERE
	pk_city = '8f9b5f5e-7a52-11df-804e-3fead1c408fb'
	AND s.str_rates LIKE '%$%'
	AND (m.b_cash_bill = TRUE
		 OR m.b_cash_coin = TRUE
		 OR m.b_check= TRUE
		 OR m.b_mc_visa = TRUE
		 OR m.b_amex = TRUE
		 OR m.b_discover = TRUE
		 OR m.b_pay_by_phone = TRUE
		 OR m.b_debit_card = TRUE
		 OR m.b_apple_pay = TRUE
		 )
	AND m.pk_meter = s.pk_meter
RETURNING m.pk_meter, m.pk_city, m.pk_meter_type, 
s.str_rates, m.pk_user_modified, m.dt_modified_date;