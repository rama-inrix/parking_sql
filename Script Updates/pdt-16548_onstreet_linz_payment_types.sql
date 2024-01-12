UPDATE meter AS m
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	b_cash_coin = TRUE,
	b_mc_visa = TRUE,
	b_debit_card = TRUE,
	b_pay_by_phone = TRUE
FROM segment AS s
WHERE
	m.pk_meter_status = 2
	AND m.pk_city IN ('9054da46-17f4-11e2-9b0c-12313d1b6657', 'f7d2f9e7-51a5-48b6-983c-6ca4d0ac869f')
	AND m.pk_operator = '78d56337-1a48-4682-96ce-7dcc0fb5b78a'
	AND s.str_rates LIKE '%€%'
	AND m.pk_meter = s.pk_meter
RETURNING m.pk_meter, m.pk_city, m.pk_operator, s.str_rates, m.b_debit_card, 
m.b_mc_visa, m.pk_user_modified, m.dt_modified_date;
