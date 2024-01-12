UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	pk_meter_type = -1,
	pk_manufacturer = 1,
	b_cash_bill = False,
	b_mc_visa = False,
	b_discover = False,
	b_debit_card = False,
	b_disc = False,
	b_cash_coin = False,
	b_amex = False,
	b_pay_by_phone = False,
	b_apple_pay = False,
	b_check = False
WHERE pk_meter IN  (52524633,
					52523129,
					52522858,
					52521556,
					52521044,
					52520611,
					52520224,
					52519931,
					52519700,
					52513816,
					52513609,
					52505976,
					52504430,
					52521445,
					52523169,
					52504652,
					52519557,
					52510003,
					52513751,
					52509646,
					52510675,
					52525033,
					52525035,
					52510471,
					52510671,
					52519294,
					52519352,
					52520372,
					52521574,
					52523156,
					52524106,
					52524822,
					52518201,
					52513492,
					52520387,
					52509986,
					52520369,
					52509657,
					52521802,
					52523928,
					52513452,
					52510748,
					52519451,
					52520995,
					52522580,
					52522751,
					52524094,
					52504714,
					52509707,
					52519284,
					52504392,
					52519457,
					52505160,
					52505374,
					52519712,
					52505311,
					52505033,
					52503358,
					52502938,
					52500033,
					52525172,
					52522131,
					52521458,
					52518074,
					52525292,
					52525110,
					52524522,
					52522504,
					52518057,
					52516123,
					52516121,
					52512476,
					52512272,
					52512103,
					52512101,
					52512057,
					52512022,
					52505114,
					52505108,
					52504953,
					52503257,
					52503098,
					52502554,
					52501218,
					52524507,
					52522619,
					52523760,
					52522505,
					52518180,
					52518121,
					52518042,
					52516195,
					52515913,
					52515867,
					52512532,
					52512054,
					52512052,
					52512021,
					52511035,
					52511030,
					52522956,
					52519986,
					52524890,
					52524175,
					52523891,
					52520943,
					52520917,
					52504960,
					52524613,
					52519445,
					52519848,
					52519585,
					52519544,
					52518976,
					52513379,
					52510687,
					52504492,
					52525068,
					52521223,
					52524346,
					52521163,
					52520600,
					52510353,
					52525054,
					52524813,
					52524128,
					52522486,
					52522147,
					52521024,
					52520630,
					52520268,
					52518519,
					52510311,
					52504876,
					52522655,
					52513484,
					52523751,
					52523224,
					52522401,
					52521478,
					52520541,
					52520202,
					52514465,
					52514036,
					52510351,
					52511408,
					52523951,
					52521852,
					52520743,
					52510299,
					52504453,
					52504422,
					52503353,
					52503030,
					52502998,
					52502633,
					52502566,
					52522009,
					52510907,
					52501039,
					52524495,
					52522043,
					52518047,
					52511343,
					52505450,
					52500023)
RETURNING pk_meter, pk_city, pk_meter_type, pk_manufacturer, 
b_cash_bill, b_mc_visa, b_discover, b_debit_card, b_disc,
b_cash_coin, b_amex, b_pay_by_phone, b_apple_pay, b_check,
pk_user_modified, dt_modified_date;