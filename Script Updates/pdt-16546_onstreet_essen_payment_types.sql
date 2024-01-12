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
	AND m.pk_city = '975ec626-17f4-11e2-9171-12313d1b6657'
	AND m.pk_operator = '9038b323-e7e3-40a8-90df-472a03500906'
	AND s.str_rates LIKE '%€%'
	AND m.pk_meter = s.pk_meter
RETURNING m.pk_meter, m.pk_city, m.pk_operator, s.str_rates, m.b_discover, m.pk_user_modified, m.dt_modified_date;