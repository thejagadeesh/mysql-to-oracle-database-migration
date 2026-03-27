load data
infile 'data/address.txt'
 "str '<EORD>'"
into table sakila.address
fields terminated by '<EOFD>'
trailing nullcols
(
address  "DECODE(:address, 'NULL', NULL, NULL, ' ', :address)",
address2  "DECODE(:address2, 'NULL', NULL, NULL, ' ', :address2)",
address_id  NULLIF address_id = 'NULL',
city_id  NULLIF city_id = 'NULL',
district  "DECODE(:district, 'NULL', NULL, NULL, ' ', :district)",
last_update "TO_DATE(DECODE(:last_update, 'NULL', NULL,  DECODE(translate(:last_update,'10 -,:.','1'), null, null,:last_update)),  'yyyy-mm-dd HH24:mi:ss')",
location  NULLIF location = 'NULL',
phone  "DECODE(:phone, 'NULL', NULL, NULL, ' ', :phone)",
postal_code  "DECODE(:postal_code, 'NULL', NULL, NULL, ' ', :postal_code)"
)
