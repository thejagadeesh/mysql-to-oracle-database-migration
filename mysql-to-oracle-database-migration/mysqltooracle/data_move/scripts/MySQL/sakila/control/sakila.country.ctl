load data
infile 'data/country.txt'
 "str '<EORD>'"
into table sakila.country
fields terminated by '<EOFD>'
trailing nullcols
(
country  "DECODE(:country, 'NULL', NULL, NULL, ' ', :country)",
country_id  NULLIF country_id = 'NULL',
last_update "TO_DATE(DECODE(:last_update, 'NULL', NULL,  DECODE(translate(:last_update,'10 -,:.','1'), null, null,:last_update)),  'yyyy-mm-dd HH24:mi:ss')"
)
