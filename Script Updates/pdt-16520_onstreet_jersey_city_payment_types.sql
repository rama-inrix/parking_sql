UPDATE meter AS m
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	b_cash_coin = TRUE,
	b_mc_visa = TRUE,
	b_pay_by_phone = TRUE
FROM segment AS s
WHERE
	m.pk_operator = 'e92dd1d3-da8b-4b20-9c18-df4adace35c5'
	AND s.str_rates LIKE '%$%'
	AND pk_meter_status = 2
	AND m.pk_meter = s.pk_meter
	AND m.pk_meter NOT IN (184500486, 184500488, 184500586, 184500628,
						   184500640, 184500644, 184500682, 184500684,
						   184500687, 184500785, 184500818, 184503798,
						   184504068, 184504069)
RETURNING m.pk_meter, m.pk_city, m.pk_meter_status, m.pk_operator,
s.str_rates, m.b_cash_coin, m.b_mc_visa, m.b_pay_by_phone, 
m.pk_user_modified, m.dt_modified_date;

-- Meters with payment types other than Cash/Coin, MC/Visa, and Pay by Phone
select distinct m.pk_meter, m.b_cash_bill, m.b_check,
m.b_amex, m.b_discover, m.b_debit_card, m.b_apple_pay
from meter m join segment s using (pk_meter)
where m.pk_operator = 'e92dd1d3-da8b-4b20-9c18-df4adace35c5'
	AND s.str_rates LIKE '%$%'
	AND pk_meter_status = 2
	and (m.b_cash_bill = True or
		 m.b_check = True or
		 m.b_amex = True or
		 m.b_discover = True or 
		 m.b_debit_card = True or 
		 m.b_apple_pay = True)