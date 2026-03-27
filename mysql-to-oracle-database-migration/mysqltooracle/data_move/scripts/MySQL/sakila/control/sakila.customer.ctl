load data
infile 'data/customer.txt'
 "str '<EORD>'"
into table sakila.customer
fields terminated by '<EOFD>'
trailing nullcols
(
active  NULLIF active = 'NULL',
address_id  NULLIF address_id = 'NULL',
create_date "TO_DATE(DECODE(:create_date, 'NULL', NULL,  DECODE(translate(:create_date,'10 -,:.','1'), null, null,:create_date)),  'yyyy-mm-dd HH24:mi:ss')",
customer_id  NULLIF customer_id = 'NULL',
email  "DECODE(:email, 'NULL', NULL, NULL, ' ', :email)",
first_name  "DECODE(:first_name, 'NULL', NULL, NULL, ' ', :first_name)",
last_name  "DECODE(:last_name, 'NULL', NULL, NULL, ' ', :last_name)",
last_update "TO_DATE(DECODE(:last_update, 'NULL', NULL,  DECODE(translate(:last_update,'10 -,:.','1'), null, null,:last_update)),  'yyyy-mm-dd HH24:mi:ss')",
store_id  NULLIF store_id = 'NULL'
)
