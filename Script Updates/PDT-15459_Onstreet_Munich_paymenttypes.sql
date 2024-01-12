UPDATE meter AS m
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	b_cash_coin = TRUE,
	b_debit_card = TRUE,
	b_pay_by_phone = TRUE
FROM segment AS s
WHERE
	pk_city IN ('971636e0-17f4-11e2-816b-12313d1b6657', '07d1cfe7-cae1-43d9-82a2-6242af86ee32')
	AND s.str_rates LIKE '%€%'
	AND m.pk_meter = s.pk_meter
RETURNING m.pk_meter, m.pk_city, s.str_rates, m.b_cash_coin, m.b_debit_card,
m.b_pay_by_phone, m.pk_user_modified, m.dt_modified_date;