load data
infile 'data/city.txt'
 "str '<EORD>'"
into table sakila.city
fields terminated by '<EOFD>'
trailing nullcols
(
city  "DECODE(:city, 'NULL', NULL, NULL, ' ', :city)",
city_id  NULLIF city_id = 'NULL',
country_id  NULLIF country_id = 'NULL',
last_update "TO_DATE(DECODE(:last_update, 'NULL', NULL,  DECODE(translate(:last_update,'10 -,:.','1'), null, null,:last_update)),  'yyyy-mm-dd HH24:mi:ss')"
)
