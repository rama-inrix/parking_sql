SELECT l.pk_lot AS "Lot_ID", 
l.str_operator AS "Operator_Name",
l.pk_operator AS "Operator_ID",
ST_AsText(l.gpnt_location) AS "Lot_Coord",
d.str_name AS "City_Name"
FROM lot AS l
	JOIN destination AS d ON l.pk_city = d.pk_destination
WHERE l.pk_lot_status IN (6, 9) AND
l.pk_city IN ('8faea5fa-7a52-11df-a6b1-17291a90f79e', '948eb4c7-2f14-483a-b56d-8a40893b88ca', '9259f5d4-3ec2-4ba1-8edc-00c3f80f1a34', -- San Francisco
			 '8fb40c16-7a52-11df-bd91-93cdc8fa625d', -- Portland
			 '8f79cf74-7a52-11df-ab07-738613b18514', '8164209b-7caa-48a5-befc-3a31c515362a', -- Miami
			 '8fad40fc-7a52-11df-bee9-93ec9d1defb1', '7dda1d0e-2384-48b6-bc86-6f8fe1e2f6ff', '4cb2dd45-c39e-43a5-a0f0-b194c0fc8f85', '1fd51bf4-00ce-47be-aa67-28c5ee94e6ea', -- Los Angeles
			 '8f8935cc-7a52-11df-85ef-037cba85cd49', 'e59c4b07-c00b-4348-86fa-1b9011fde267', -- Philadelphia
			 '8faeab9a-7a52-11df-afd6-7337b723a87f', 'dc6fa85b-068d-4e1f-9110-751ffd14df28', -- San Jose
			 '8f79d14a-7a52-11df-997e-ff1e99959de6', -- Miami Beach
			 '8f95d02a-7a52-11df-ba0e-8fbef256f7a4', '3cf48f2b-500c-4684-a747-3341022138ac') -- Boston