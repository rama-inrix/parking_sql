-- This query must be run first to create in the prod database
-- the table containing the data to be bulk-inserted into the segment_company_payment 
-- table as a CSV, for both dev and prod.
-- For the purposes of updating the dev database, a table must then be created on dev
-- and filled with the data pulled from this query in the form of a CSV. 
-- This must be done throught the terminal.


CREATE TABLE tmp_scp_16129 (
    pk_segment varchar(36),
    pk_company varchar(36),
    payment_id varchar(36)
	);
	
CREATE TABLE tmp_companies_16129 (
   c_id varchar(36),
   c_name varchar(36)
);

INSERT INTO tmp_companies_16129 (c_id, c_name)
VALUES ('9eeb1191-d0d4-4233-875d-8a708c6758ab', 'ParkMobile'), 
	('f875e5a2-8dad-464f-867c-bfc05ee5b942', 'Yellowbrick'), 
	('a9dee904-8364-4654-bdb9-386c585dcfbb', 'SMSParking'),
	('179b3c63-ad0f-4714-8007-b4480d5fa72c', 'MKB Brandstof'),
 	('f3a02d01-4e38-4342-8d22-f11b3c9c799e', 'ease2pay'),
 	('2aa79d5c-7734-4171-be26-249a87b2980c', 'PARKD'),
	('59836a4d-29d0-4bd5-b605-555f4247bb9f', 'Q-Park app'),
	('6457e466-e442-491c-9f18-a33d2c7eb8a5', 'ULU'),
	('b3ecbf19-0973-45b8-aaba-20d7858951bb', 'EasyPark'),
	('a680a82a-5c78-4d91-ad6a-c4feef378ef4', 'tanQyou'),
 	('33922f82-36f4-41b2-9281-021a0fb9fc0e', 'Flitsmeister (via 4411)'),
 	('c32a2495-5306-4cd2-a85e-7949d84cb485', 'MobiFi'),
 	('1f43d4b6-bd0a-4c7b-91f0-f12042a210e3', 'PayByPhone'),
 	('3f831899-357f-4b82-a3a2-74f0ecc45262', 'Lekker Parkeren'),
 	('7fa6bf76-3355-493e-90fa-3fb8b748059b', 'Gaiyo');

DO
$$
DECLARE
    f record;
BEGIN
    FOR f IN SELECT * FROM tmp_companies_16129
    LOOP -- Iterates through company pks listed in the tmp_companies table above
	INSERT INTO tmp_scp_16129
	SELECT distinct s.pk_segment,
	    f.c_id AS pk_company,
	    scp.str_id AS payment_id
	FROM segment AS s
	    JOIN meter AS m USING (pk_meter)
	    JOIN segment_company_payment AS scp USING (pk_segment)
	WHERE NOT EXISTS (
    	        SELECT 1
	        	FROM segment_company_payment AS scp2
	        	WHERE scp2.pk_segment = s.pk_segment
		    	AND scp2.pk_company = f.c_id) -- Checks if segment pk is already associated with company pk and does not select it if it is
	    AND m.pk_city IN ('9d340b88-17f4-11e2-bd3b-12313d1b6657', '3c5b1a7b-900b-4799-9c71-d539f496d755') -- Rotterdam 
	    AND s.str_rates LIKE '%€%'; -- Paid segment
    end loop;
end;
$$;

SELECT * FROM tmp_scp_16129;

DROP TABLE tmp_companies_16129;