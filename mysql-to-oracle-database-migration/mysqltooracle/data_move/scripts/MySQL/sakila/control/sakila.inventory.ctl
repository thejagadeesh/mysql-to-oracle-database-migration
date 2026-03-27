load data
infile 'data/inventory.txt'
 "str '<EORD>'"
into table sakila.inventory
fields terminated by '<EOFD>'
trailing nullcols
(
film_id  NULLIF film_id = 'NULL',
inventory_id  NULLIF inventory_id = 'NULL',
last_update "TO_DATE(DECODE(:last_update, 'NULL', NULL,  DECODE(translate(:last_update,'10 -,:.','1'), null, null,:last_update)),  'yyyy-mm-dd HH24:mi:ss')",
store_id  NULLIF store_id = 'NULL'
)
