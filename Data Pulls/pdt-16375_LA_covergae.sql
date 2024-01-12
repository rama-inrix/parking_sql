SELECT ST_ASTEXT(mpoly_location) 
from destination 
where pk_destination IN ('8fad40fc-7a52-11df-bee9-93ec9d1defb1', 
						 '7dda1d0e-2384-48b6-bc86-6f8fe1e2f6ff', 
						 '4cb2dd45-c39e-43a5-a0f0-b194c0fc8f85', 
						 '1fd51bf4-00ce-47be-aa67-28c5ee94e6ea', 
						 '04557b80-41db-48fb-97e2-e3ec8d9be554');