UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	str_website = 'https://www.cityoflondon.gov.uk/services/parking/on-street-parking'
FROM segment
WHERE
	pk_city IN ('9887d39e-17f4-11e2-8f4c-12313d1b6657',
				'9995dc69-b2bb-4a9b-98b6-51acd1a87bd3',
				'1df305f2-7d1a-49aa-9f66-2f486aa5f3c0')
	AND pk_meter_status = 2
	AND pk_operator = '2231de65-c11b-4f2b-9fdf-34da33335992' --City of London
	AND meter.pk_meter = segment.pk_meter
RETURNING meter.pk_meter, meter.pk_city, meter.str_website, 
meter.pk_user_modified, meter.dt_modified_date;


UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	str_website = 'https://hackney.gov.uk/menu/#parking'
FROM segment
WHERE
	pk_city IN ('9887d39e-17f4-11e2-8f4c-12313d1b6657',
				'9995dc69-b2bb-4a9b-98b6-51acd1a87bd3',
				'1df305f2-7d1a-49aa-9f66-2f486aa5f3c0')
	AND pk_meter_status = 2
	AND pk_operator = '2fc92a04-a804-47a0-95db-9ddc21e31ca6' --Hackney Council
	AND meter.pk_meter = segment.pk_meter
RETURNING meter.pk_meter, meter.pk_city, meter.str_website, 
meter.pk_user_modified, meter.dt_modified_date;


UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	str_website = 'https://www.islington.gov.uk/parking'
FROM segment
WHERE
	pk_city IN ('9887d39e-17f4-11e2-8f4c-12313d1b6657',
				'9995dc69-b2bb-4a9b-98b6-51acd1a87bd3',
				'1df305f2-7d1a-49aa-9f66-2f486aa5f3c0')
	AND pk_meter_status = 2
	AND pk_operator = 'cdf8c867-dc51-4097-803a-de34e4a4e7b9' --Islington Council
	AND meter.pk_meter = segment.pk_meter
RETURNING meter.pk_meter, meter.pk_city, meter.str_website, 
meter.pk_user_modified, meter.dt_modified_date;


UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	str_website = 'https://www.lambeth.gov.uk/parking'
FROM segment
WHERE
	pk_city IN ('9887d39e-17f4-11e2-8f4c-12313d1b6657',
				'9995dc69-b2bb-4a9b-98b6-51acd1a87bd3',
				'1df305f2-7d1a-49aa-9f66-2f486aa5f3c0')
	AND pk_meter_status = 2
	AND pk_operator = 'e887530d-7d4c-4785-a0cb-9942c7a5cffc' --Lambeth Council
	AND meter.pk_meter = segment.pk_meter
RETURNING meter.pk_meter, meter.pk_city, meter.str_website, 
meter.pk_user_modified, meter.dt_modified_date;


UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	str_website = 'https://www.camden.gov.uk/parking'
FROM segment
WHERE
	pk_city IN ('9887d39e-17f4-11e2-8f4c-12313d1b6657',
				'9995dc69-b2bb-4a9b-98b6-51acd1a87bd3',
				'1df305f2-7d1a-49aa-9f66-2f486aa5f3c0')
	AND pk_meter_status = 2
	AND pk_operator = '621eab9b-ce3e-4238-8d3c-68ab79ac1e41' --London Borough of Camden
	AND meter.pk_meter = segment.pk_meter
RETURNING meter.pk_meter, meter.pk_city, meter.str_website, 
meter.pk_user_modified, meter.dt_modified_date;


UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	str_website = 'https://www.lbhf.gov.uk/parking/pay-and-display/parking-zone-times-and-charges'
FROM segment
WHERE
	pk_city IN ('9887d39e-17f4-11e2-8f4c-12313d1b6657',
				'9995dc69-b2bb-4a9b-98b6-51acd1a87bd3',
				'1df305f2-7d1a-49aa-9f66-2f486aa5f3c0')
	AND pk_meter_status = 2
	AND pk_operator = '3c24be4d-75d3-41be-8b55-87d79009302c' --London Borough of Hammersmith and Fulham
	AND meter.pk_meter = segment.pk_meter
RETURNING meter.pk_meter, meter.pk_city, meter.str_website, 
meter.pk_user_modified, meter.dt_modified_date;


UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	str_website = 'https://www.southwark.gov.uk/parking/find-somewhere-to-park/parking-zones'
FROM segment
WHERE
	pk_city IN ('9887d39e-17f4-11e2-8f4c-12313d1b6657',
				'9995dc69-b2bb-4a9b-98b6-51acd1a87bd3',
				'1df305f2-7d1a-49aa-9f66-2f486aa5f3c0')
	AND pk_meter_status = 2
	AND pk_operator = '9db6603c-41b3-4f75-944c-ee247a4c3086' --Southwark Council
	AND meter.pk_meter = segment.pk_meter
RETURNING meter.pk_meter, meter.pk_city, meter.str_website, 
meter.pk_user_modified, meter.dt_modified_date;


UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	str_website = 'https://www.rbkc.gov.uk/parking-transport-and-streets/visitor-parking-and-pay-phone/paybyphone'
FROM segment
WHERE
	pk_city IN ('9887d39e-17f4-11e2-8f4c-12313d1b6657',
				'9995dc69-b2bb-4a9b-98b6-51acd1a87bd3',
				'1df305f2-7d1a-49aa-9f66-2f486aa5f3c0')
	AND pk_meter_status = 2
	AND pk_operator = '4689b1c2-392c-46a2-9c23-b030cddb5291' --The Royal Borough of Kensington and Chelsea
	AND meter.pk_meter = segment.pk_meter
RETURNING meter.pk_meter, meter.pk_city, meter.str_website, 
meter.pk_user_modified, meter.dt_modified_date;


UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	str_website = 'https://www.towerhamlets.gov.uk/lgnl/transport_and_streets/Parking/Parking.aspx'
FROM segment
WHERE
	pk_city IN ('9887d39e-17f4-11e2-8f4c-12313d1b6657',
				'9995dc69-b2bb-4a9b-98b6-51acd1a87bd3',
				'1df305f2-7d1a-49aa-9f66-2f486aa5f3c0')
	AND pk_meter_status = 2
	AND pk_operator = '03e38748-0aaa-11e3-bb37-22000af8682a' --Tower Hamlets
	AND meter.pk_meter = segment.pk_meter
RETURNING meter.pk_meter, meter.pk_city, meter.str_website, 
meter.pk_user_modified, meter.dt_modified_date;


UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	str_website = 'https://tfl.gov.uk/modes/driving/red-routes/rules-of-red-routes?intcmp=2192'
FROM segment
WHERE
	pk_city IN ('9887d39e-17f4-11e2-8f4c-12313d1b6657',
				'9995dc69-b2bb-4a9b-98b6-51acd1a87bd3',
				'1df305f2-7d1a-49aa-9f66-2f486aa5f3c0')
	AND pk_meter_status = 2
	AND pk_operator = '5dc011f7-b829-4209-af62-ce45d236fce9' --Transport for London
	AND meter.pk_meter = segment.pk_meter
RETURNING meter.pk_meter, meter.pk_city, meter.str_website, 
meter.pk_user_modified, meter.dt_modified_date;


UPDATE meter
SET pk_user_modified = 660973,
	dt_modified_date = NOW(),
	str_website = 'https://www.westminster.gov.uk/parking'
FROM segment
WHERE
	pk_city IN ('9887d39e-17f4-11e2-8f4c-12313d1b6657',
				'9995dc69-b2bb-4a9b-98b6-51acd1a87bd3',
				'1df305f2-7d1a-49aa-9f66-2f486aa5f3c0')
	AND pk_meter_status = 2
	AND pk_operator = '54c91bb2-445f-4082-b1b0-b3c50397dee3' --Westminster City Council
	AND meter.pk_meter = segment.pk_meter
RETURNING meter.pk_meter, meter.pk_city, meter.str_website, 
meter.pk_user_modified, meter.dt_modified_date;
