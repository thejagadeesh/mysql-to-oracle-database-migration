load data
infile 'data/category.txt'
 "str '<EORD>'"
into table sakila.category
fields terminated by '<EOFD>'
trailing nullcols
(
category_id  NULLIF category_id = 'NULL',
last_update "TO_DATE(DECODE(:last_update, 'NULL', NULL,  DECODE(translate(:last_update,'10 -,:.','1'), null, null,:last_update)),  'yyyy-mm-dd HH24:mi:ss')",
name  "DECODE(:name, 'NULL', NULL, NULL, ' ', :name)"
)
