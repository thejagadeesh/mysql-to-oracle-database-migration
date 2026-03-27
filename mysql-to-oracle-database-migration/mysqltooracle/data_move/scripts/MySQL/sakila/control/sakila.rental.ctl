load data
infile 'data/rental.txt'
 "str '<EORD>'"
into table sakila.rental
fields terminated by '<EOFD>'
trailing nullcols
(
customer_id  NULLIF customer_id = 'NULL',
inventory_id  NULLIF inventory_id = 'NULL',
last_update "TO_DATE(DECODE(:last_update, 'NULL', NULL,  DECODE(translate(:last_update,'10 -,:.','1'), null, null,:last_update)),  'yyyy-mm-dd HH24:mi:ss')",
rental_date "TO_DATE(DECODE(:rental_date, 'NULL', NULL,  DECODE(translate(:rental_date,'10 -,:.','1'), null, null,:rental_date)),  'yyyy-mm-dd HH24:mi:ss')",
rental_id  NULLIF rental_id = 'NULL',
return_date "TO_DATE(DECODE(:return_date, 'NULL', NULL,  DECODE(translate(:return_date,'10 -,:.','1'), null, null,:return_date)),  'yyyy-mm-dd HH24:mi:ss')",
staff_id  NULLIF staff_id = 'NULL'
)
