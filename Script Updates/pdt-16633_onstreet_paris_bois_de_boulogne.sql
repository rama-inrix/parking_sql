UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	pk_meter_type = 6,
	b_cash_bill = False,
	b_mc_visa = False,
	b_discover = False,
	b_debit_card = False,
	b_disc = False,
	b_cash_coin = False,
	b_amex = False,
	b_pay_by_phone = True,
	b_apple_pay = False,
	b_check = False
WHERE pk_meter IN (52500832, 52500407, 52500409, 52524424)
RETURNING pk_meter, pk_city, pk_meter_type, b_cash_bill, 
b_mc_visa, b_discover, b_debit_card, b_disc, b_cash_coin, 
b_amex, b_pay_by_phone, b_apple_pay, b_check, pk_user_modified,
dt_modified_date;