load data
infile 'data/language.txt'
 "str '<EORD>'"
into table sakila.language
fields terminated by '<EOFD>'
trailing nullcols
(
language_id  NULLIF language_id = 'NULL',
last_update "TO_DATE(DECODE(:last_update, 'NULL', NULL,  DECODE(translate(:last_update,'10 -,:.','1'), null, null,:last_update)),  'yyyy-mm-dd HH24:mi:ss')",
name  "DECODE(:name, 'NULL', NULL, NULL, ' ', :name)"
)
