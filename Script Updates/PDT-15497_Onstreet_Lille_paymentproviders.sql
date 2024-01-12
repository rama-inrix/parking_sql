-- The commented query was run to obtain the segment pks to NOT modify in the below query, so as
-- to avoid generating a duplicate (pk_segment, pk_company) entry. I initially attempted a different
-- approach which yielded an error I still can't explain, regarding a pk_segment that was NOT manually
-- excluded in this query.

-- SELECT pk_segment 
-- FROM segment_company_payment AS scp1 JOIN
-- 	  segment_company_payment AS scp2 USING (pk_segment)
-- WHERE scp1.pk_company = '0eda6d8b-dcb0-4df8-b425-c35c45aa7c41'
-- 	  AND scp2.pk_company = 'f3b1e51b-273e-4aca-be89-756a467f937e';

WITH modmeters AS (
	--Change Whoosh pk to Flowbird pk on all paid blocks in Lille
	UPDATE segment_company_payment AS scp
	SET pk_company = 'f3b1e51b-273e-4aca-be89-756a467f937e' -- flowbird
	FROM segment AS s 
		INNER JOIN meter AS m USING (pk_meter)
	WHERE
		scp.pk_segment = s.pk_segment
		AND scp.pk_company = '0eda6d8b-dcb0-4df8-b425-c35c45aa7c41' -- Whoosh
		AND m.pk_city = '9843ecba-17f4-11e2-91bb-12313d1b6657' -- Lille
		-- conditions for paid blocks:
		AND s.str_rates LIKE '%€%'
		AND (m.b_cash_bill = TRUE
			 OR m.b_cash_coin = TRUE
			 OR m.b_check = TRUE
			 OR m.b_mc_visa = TRUE
			 OR m.b_amex = TRUE
			 OR m.b_discover = TRUE
			 OR m.b_pay_by_phone = TRUE
			 OR m.b_debit_card = TRUE
			 OR m.b_apple_pay = TRUE
			 )
		-- end
		-- segment pks currently associated to both whoosh and flowbird:
		AND s.pk_segment NOT IN ('05975c1e-aab2-44a8-9900-913a18e08cc6', '06c049c7-6a2a-4532-9283-538b83b6ab6a',
		'238b5966-9b87-4c62-8634-c7492d36eff9', '5ca7c97c-cfae-4123-9c98-9e8a29e8af38', '6bb67a69-acac-438d-b90d-f3036ed7466a',
		'8566cabc-d339-4c81-a0ba-0b4435cbc266', '79812609-4c67-4bdc-a271-3b5197e28f17', '8de614c7-87ca-4f52-b517-4688ad67a137',
		'bc35649c-66c4-45be-92e6-a14866adc93e', 'be803a5c-30c1-4386-a5ff-5c107e2dbc70', '9ad2d7f2-3fde-4932-a302-b1f874b75d64')
		-- end
	RETURNING scp.str_id, scp.pk_segment, scp.pk_company, 
	m.pk_meter, m.pk_city
	)
UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW()
FROM modmeters
WHERE modmeters.pk_meter = meter.pk_meter
RETURNING modmeters.str_id, modmeters.pk_segment, modmeters.pk_company, 
	modmeters.pk_meter, modmeters.pk_city, meter.pk_user_modified, meter.dt_modified_date;


-- Remove all rows from segment_company_payment that correspond to Lille where company isn't Flowbird
WITH modmeters AS (
	DELETE FROM segment_company_payment AS scp
	USING segment AS s,
		meter AS m
	WHERE scp.pk_segment = s.pk_segment
		AND s.pk_meter = m.pk_meter
		AND m.pk_city = '9843ecba-17f4-11e2-91bb-12313d1b6657' -- Lille
		AND scp.pk_company != 'f3b1e51b-273e-4aca-be89-756a467f937e' -- Flowbird
	RETURNING scp.str_id, scp.pk_segment, scp.pk_company, 
	m.pk_meter, m.pk_city)
UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW()
FROM modmeters
WHERE modmeters.pk_meter = meter.pk_meter
RETURNING modmeters.str_id, modmeters.pk_segment, modmeters.pk_company, 
	modmeters.pk_meter, modmeters.pk_city, meter.pk_user_modified, meter.dt_modified_date;