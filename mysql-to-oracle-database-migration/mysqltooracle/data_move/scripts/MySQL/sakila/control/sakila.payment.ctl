load data
infile 'data/payment.txt'
 "str '<EORD>'"
into table sakila.payment
fields terminated by '<EOFD>'
trailing nullcols
(
amount  NULLIF amount = 'NULL',
customer_id  NULLIF customer_id = 'NULL',
last_update "TO_DATE(DECODE(:last_update, 'NULL', NULL,  DECODE(translate(:last_update,'10 -,:.','1'), null, null,:last_update)),  'yyyy-mm-dd HH24:mi:ss')",
payment_date "TO_DATE(DECODE(:payment_date, 'NULL', NULL,  DECODE(translate(:payment_date,'10 -,:.','1'), null, null,:payment_date)),  'yyyy-mm-dd HH24:mi:ss')",
payment_id  NULLIF payment_id = 'NULL',
rental_id  NULLIF rental_id = 'NULL',
staff_id  NULLIF staff_id = 'NULL'
)
