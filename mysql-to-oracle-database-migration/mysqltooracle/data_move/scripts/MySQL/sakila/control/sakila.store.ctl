load data
infile 'data/store.txt'
 "str '<EORD>'"
into table sakila.store
fields terminated by '<EOFD>'
trailing nullcols
(
address_id  NULLIF address_id = 'NULL',
last_update "TO_DATE(DECODE(:last_update, 'NULL', NULL,  DECODE(translate(:last_update,'10 -,:.','1'), null, null,:last_update)),  'yyyy-mm-dd HH24:mi:ss')",
manager_staff_id  NULLIF manager_staff_id = 'NULL',
store_id  NULLIF store_id = 'NULL'
)
