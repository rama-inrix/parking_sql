UPDATE meter as m
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	b_cash_coin = TRUE,
	b_cash_bill = TRUE,
	b_mc_visa = TRUE,
	b_debit_card = TRUE,
	b_pay_by_phone = TRUE
FROM segment AS s 
JOIN segment_policy AS sp using (pk_segment)
	JOIN segment_rule AS sr USING (pk_policy)
	JOIN segment_rate AS srt ON (sp.pk_policy = srt.pk_policy)
	WHERE b_driveway IS FALSE
				AND sr.str_activity = 'parking'
				AND srt.f_rate >0
				AND pk_meter_status = 2
				AND pk_operator = 'c5c5de29-f91f-4586-ace4-e7dbf8abbd8f'
				AND m.pk_meter = s.pk_meter
RETURNING m.pk_meter, m.pk_city, m.b_cash_coin, m.b_mc_visa, m.b_debit_card,
m.b_pay_by_phone, m.pk_operator, m.pk_user_modified, m.dt_modified_date;