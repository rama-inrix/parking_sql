UPDATE meter AS m
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	pk_meter_type = 6
FROM segment AS s
WHERE
	m.pk_city = '8fb40c16-7a52-11df-bd91-93cdc8fa625d'
	AND m.pk_meter_type = 4
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
RETURNING m.pk_meter, m.pk_city, s.str_rates, m.pk_meter_type,
m.pk_user_modified, m.dt_modified_date;