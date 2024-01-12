UPDATE meter as m
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	b_cash_bill = True,
	b_cash_coin = True,
	b_mc_visa = True,
	b_debit_card = True,
	b_pay_by_phone = True,
	b_apple_pay = True
FROM segment
WHERE m.pk_meter in (38505888, 38509980, 38505891, 38510639, 38510143, 38510146,
					 38509824, 38506810, 38505652, 38506542, 38505887, 38510196,
					 38505682, 38503263, 38506484, 38509983, 38503225, 38500479,
					 38505890, 38503076, 38505708, 38505669, 38506586, 38503073,
					 38503175, 38510641, 38503170, 38511217, 38505692, 38505666,
					 38512462, 38503129, 38509986, 38512463, 38510215, 38506427,
					 38506303, 38510814, 38506306, 38506460, 38503075, 38503171,
					 38505889, 38503122, 38503232, 38510678, 38503118, 38506492,
					 38506251, 38505724, 38505683, 38503174, 38506406, 38506602,
					 38510682, 38505649, 38510186, 38505573, 38510140, 38503120,
					 38505690, 38505850, 38505727, 38505726, 38503136, 38503172,
					 38503124, 38503192, 38503193, 38503137, 38500499, 38503184)
AND m.pk_meter = segment.pk_meter
RETURNING m.pk_meter, m.b_cash_bill, m.b_cash_coin, m.b_mc_visa, m.b_debit_card, 
m.b_pay_by_phone, m.b_apple_pay, m.pk_user_modified, m.dt_modified_date;