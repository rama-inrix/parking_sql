SELECT REGEXP_REPLACE(d.str_name, '(@.*|\s-.*)', '') "City Name", COUNT(m.pk_meter) "Block Count"
FROM destination as d 
JOIN meter as m ON (d.pk_destination = m.pk_city)
WHERE d.pk_destination IN ('8f8ed9b4-7a52-11df-a187-0f6873d34b4d', --Alexandria
						   '9d37d6fa-17f4-11e2-b590-12313d1b6657', '5994843e-5d41-4a93-af2e-87f0141983df', --Amsterdam
						   '8f7c2288-7a52-11df-8a07-9b05f722855d', --Atlanta
						   '8f8b9146-7a52-11df-99e8-538d0503d72a', '8200c9e0-b5c6-4b35-baf2-ce4c68729993', --Austin 
						   '98049344-17f4-11e2-baa1-12313d1b6657', --Barcelona
						   '9d39db76-17f4-11e2-9f63-12313d1b6657', '1d78b976-c0e5-4493-b3d1-1957ac8f4bf7', --Bergen 
						   '8faaa3f6-7a52-11df-a935-8b8cacd4d9eb', --Berkeley
						   '978148ea-17f4-11e2-a897-12313d1b6657', --Berlin 
						   '98a65ef4-17f4-11e2-8d2d-12313d1b6657', '53011ec9-8ce0-4655-a188-26d3561c79fa', --Birmingham 
						   '984614ea-17f4-11e2-a5ea-12313d1b6657', --Bordeaux 
						   '8f95d02a-7a52-11df-ba0e-8fbef256f7a4', '3cf48f2b-500c-4684-a747-3341022138ac', --Boston 
						   '90b2bd1e-17f4-11e2-9f58-12313d1b6657', --Brussels 
						   '8f4d0d72-7a52-11df-b17b-b732324da004', --Calgary 
						   '8f95e02e-7a52-11df-a2c1-b739ee17e5a3', --Cambridge 
						   '8f855a92-7a52-11df-abf4-37f3ed537a28', --Charlotte 
						   '8f92634a-7a52-11df-89e0-c7c2b13caea7', '629198f0-8083-4f2f-b3e8-5c311a343769', --Chicago 
						   '9730baec-17f4-11e2-b880-12313d1b6657', 'f3e01688-9399-4e7d-9482-3f56555c1609', --Cologne 
						   '8f875842-7a52-11df-9a92-13dc5e4f3c47', --Columbus 
						   '8fab6f34-7a52-11df-8be3-1bfba70d1ef7', --Cupertino 
						   '8f8c42e4-7a52-11df-be21-472335edca3d', --Dallas 
						   '8fb0459a-7a52-11df-8cbf-37a45bc10013', --Denver 
						   '8f991d52-7a52-11df-9e03-bbc37281c2f4', --Detroit 
						   '97742106-17f4-11e2-9f3d-12313d1b6657', --Dortmund
						   '8f8c84ca-7a52-11df-8d14-cf0f0660861b', --Fort Worth 
						   '975e579a-17f4-11e2-8115-12313d1b6657', 'bcfca61c-f945-43ad-89ef-85d4055335da', --Frankfurt 
						   '9750a014-17f4-11e2-bbe3-12313d1b6657', '0c34335c-699a-43cc-a4a6-9abb85ac1a69', --Hamburg
						   '8f8cdf10-7a52-11df-8045-3b9f4467140a', --Houston 
						   '8f7e772c-7a52-11df-b6c0-f7b558d7dd5a', --Indianapolis 
						   '8f7922e0-7a52-11df-84ac-07f1e56b2a8d', --Jacksonville
						   '8fb18482-7a52-11df-92fa-53787a23f289', --Las Vegas 
						   '9889a70a-17f4-11e2-9b8c-12313d1b6657', '64687b2e-19e8-4ace-a959-1d527565f1e4', --Liverpool 
						   '9887d39e-17f4-11e2-8f4c-12313d1b6657', '9995dc69-b2bb-4a9b-98b6-51acd1a87bd3', --London 
						   '8fad3788-7a52-11df-b1f4-831a189ffe88', --Long Beach 
						   '8fad40fc-7a52-11df-bee9-93ec9d1defb1', '7dda1d0e-2384-48b6-bc86-6f8fe1e2f6ff', '1fd51bf4-00ce-47be-aa67-28c5ee94e6ea', 'ebea3111-e08d-45ca-a1f7-506e208f729b', '4cb2dd45-c39e-43a5-a0f0-b194c0fc8f85', '5fdd68d0-9498-4e5d-beef-6b12894dd3f4', --Los Angeles 
						   '98437348-17f4-11e2-ab33-12313d1b6657', '43132d03-5448-413c-bfee-89bf1c84c40e', --Lyon 
						   '97fd56ba-17f4-11e2-b6f6-12313d1b6657', '9339da10-4b0c-41f7-949a-abbd013b8a97', --Madrid 
						   '98432d5c-17f4-11e2-a10f-12313d1b6657', '0e624b3d-410b-4a52-a336-310a09e0cbea', --Marseille 
						   '8f79cf74-7a52-11df-ab07-738613b18514', '8164209b-7caa-48a5-befc-3a31c515362a', --Miami 
						   '8f79d14a-7a52-11df-997e-ff1e99959de6', --Miami Beach 
						   '9a739c92-17f4-11e2-b6a2-12313d1b6657', --Milan 
						   '8f4de8fa-7a52-11df-a7f3-43212ff02681', --Montreal
						   '971636e0-17f4-11e2-816b-12313d1b6657', '07d1cfe7-cae1-43d9-82a2-6242af86ee32', --Munich 
						   '9a72cf9c-17f4-11e2-8804-12313d1b6657', --Naples 
						   '8fa1d7a8-7a52-11df-b7ed-5b0c599fe066', '907dff4c-76f5-4ce3-87d4-344b81372f3d', '0725d895-fb7a-4920-a0bd-3ef05832cfb7', --New York 
						   '8fade034-7a52-11df-9e26-c39673cf16ff', --Oakland 
						   '9d399530-17f4-11e2-b71e-12313d1b6657', 'bc6a798d-eaba-48bd-88ce-11daf12cdc44', --Oslo 
						   '8fae0ed8-7a52-11df-b6ac-c33827de5a34', --Palo Alto 
						   '9840eb96-17f4-11e2-801f-12313d1b6657', '9bb0fb5f-04c8-45ed-9154-654a362f64b4', --Paris 
						   '8f8935cc-7a52-11df-85ef-037cba85cd49', 'e59c4b07-c00b-4348-86fa-1b9011fde267', --Philadelphia 
						   '8fa9dfde-7a52-11df-af59-273aa13aeea1', 'c4930b70-d1a2-4162-81ce-afef2d440454', --Phoenix 
						   '37e23981-3188-4a1d-a050-902dc27e2409', --Portland 
						   '8f86367e-7a52-11df-9c9e-1316e3f5eacd', --Raleigh 
						   '9a703638-17f4-11e2-9f83-12313d1b6657', --Rome 
						   '8f8e265e-7a52-11df-bb2d-5f15eb70ef83', --San Antonio 
						   '8fae9e8e-7a52-11df-9eaf-4bc75e197fae', 'bb4d7a68-c2b9-428b-bf8e-ab1d7909f70e', --San Diego
						   '8faea5fa-7a52-11df-a6b1-17291a90f79e', '9259f5d4-3ec2-4ba1-8edc-00c3f80f1a34', '948eb4c7-2f14-483a-b56d-8a40893b88ca', --San Francisco 
						   '8faeab9a-7a52-11df-afd6-7337b723a87f', 'dc6fa85b-068d-4e1f-9110-751ffd14df28', --San Jose
						   '8faeea56-7a52-11df-ad8f-6b84bf453d3d', --Santa Monica
						   '2dd429b1-fdc3-4c32-80a5-462f1dd76fa7', --Seattle
						   '9e73edba-17f4-11e2-b79c-12313d1b6657', '29a91409-1aad-42d3-b35d-7d3ba85b5d97', --Stockholm
						   '96f1945c-17f4-11e2-a546-12313d1b6657', '14bd1fab-ec13-4f9c-8bd3-c9ccc0e187ee', --Stuttgart
						   '8f4ee6ba-7a52-11df-937f-b7b17e1bdc55', --Toronto 
						   '9a6edf54-17f4-11e2-8b2a-12313d1b6657', --Turin 
						   '8f4ef4fc-7a52-11df-b6bf-5f39bd682706', --Vancouver 
						   '90532912-17f4-11e2-bf17-12313d1b6657', 'ff1130c6-b9ee-4a3d-97fc-3a06f288d053', --Vienna 
						   '8f775ed8-7a52-11df-9234-77e8e51ddfce', 'af24db44-8fb2-4a4b-9078-9a622834d577', --Washington, D.C.
						   '925c8140-17f4-11e2-8044-12313d1b6657') --Zurich
AND m.pk_meter_status = 2
GROUP BY REGEXP_REPLACE(d.str_name, '(@.*|\s-.*)', '')
ORDER BY 1;
