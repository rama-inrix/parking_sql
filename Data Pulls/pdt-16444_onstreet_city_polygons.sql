SELECT str_name, ST_ASText(mpoly_onstreet)
FROM destination JOIN state USING (pk_state)
WHERE str_category = 'CITY' 
AND mpoly_onstreet IS NOT NULL
AND destination.pk_country = 'b363bb38-ca10-11e1-9278-12313d1b6657' -- USA
AND state.str_state_name IN ('California', 'Washington', 'Oregon', 'Florida',
							 'Pennsylvania', 'Minnesota', 'Massachusetts',
							 'New York', 'Colorado', 'Texas', 'Illinois', 'Nebraska',
							 'Rhode Island', 'Arkansas', 'Michigan', 'Ohio', 'Georgia',
							 'Indiana', 'Kentucky', 'District of Columbia');


SELECT d.str_name, ST_ASText(d.mpoly_onstreet)
FROM destination as d
WHERE d.str_name IN (
  'Seattle@30', 'Portland@30', 'Miami@30', 'Los Angeles@30', 'Philadelphia@30',
  'San Jose@30', 'Minneapolis@30', 'Miami Beach@30', 'Boston@30', 'New York@30',
  'Denver@30', 'Austin@30', 'Washington D.C.@30', 'Long Beach@30', 'Cambridge@30',
  'Chicago@30', 'Coral Gables@30', 'Omaha@30', 'Pittsburgh@30', 'Providence@30',
  'Fayetteville@30', 'Detroit@30', 'San Diego@30', 'Columbus@30', 'Atlanta@30',
  'Indianapolis@30', 'Louisville@30', 'Tampa@30'
);

