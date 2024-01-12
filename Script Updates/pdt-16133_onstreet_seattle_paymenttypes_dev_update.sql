UPDATE meter AS m
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	b_discover = TRUE,
	b_cash_coin = TRUE,
	b_mc_visa = TRUE,
	b_amex = TRUE,
	b_debit_card = TRUE,
	b_pay_by_phone = TRUE
FROM temp_1 AS t
WHERE m.pk_meter = t.pk_meter
RETURNING m.pk_meter, m.pk_city, m.pk_operator, m.b_discover, m.pk_user_modified, m.dt_modified_date;