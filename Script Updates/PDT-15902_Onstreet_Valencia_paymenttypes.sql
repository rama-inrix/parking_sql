UPDATE meter AS m
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	b_cash_coin = TRUE,
	b_mc_visa = TRUE,
	b_debit_card = TRUE,
	b_pay_by_phone = TRUE,
	b_apple_pay = TRUE
FROM segment AS s
WHERE
	m.pk_city = '97d4eb6c-17f4-11e2-b796-12313d1b6657'
	AND m.pk_meter_status = 2 
	AND s.str_rates LIKE '%€%'
	AND m.pk_meter = s.pk_meter
RETURNING m.pk_meter, m.pk_city, m.b_cash_coin, m.b_mc_visa, m.b_debit_card,
m.b_pay_by_phone, m.b_apple_pay, m.pk_user_modified, m.dt_modified_date;
