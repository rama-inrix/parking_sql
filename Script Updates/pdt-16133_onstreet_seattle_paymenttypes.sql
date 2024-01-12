UPDATE meter AS m
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	b_discover = TRUE,
	b_cash_coin = TRUE,
	b_mc_visa = TRUE,
	b_amex = TRUE,
	b_debit_card = TRUE,
	b_pay_by_phone = TRUE
FROM segment AS s
WHERE
	m.pk_city IN ('8fb66ce0-7a52-11df-8bdf-bb1f4e1170cb', '2dd429b1-fdc3-4c32-80a5-462f1dd76fa7', 'b2e87ed7-4655-4ae5-8953-02e45ae6a2dd')
	AND m.pk_operator = '1b5cab01-c753-4837-9a10-1cb437ead110'
	AND (s.str_rates LIKE '%$%' OR s.str_rates LIKE '%See Meter%')
	AND m.pk_meter = s.pk_meter
RETURNING m.pk_meter, m.pk_city, m.pk_operator, s.str_rates, m.b_discover, m.pk_user_modified, m.dt_modified_date;