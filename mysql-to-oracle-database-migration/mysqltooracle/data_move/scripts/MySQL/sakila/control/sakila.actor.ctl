load data
infile 'data/actor.txt'
 "str '<EORD>'"
into table sakila.actor
fields terminated by '<EOFD>'
trailing nullcols
(
actor_id  NULLIF actor_id = 'NULL',
first_name  "DECODE(:first_name, 'NULL', NULL, NULL, ' ', :first_name)",
last_name  "DECODE(:last_name, 'NULL', NULL, NULL, ' ', :last_name)",
last_update "TO_DATE(DECODE(:last_update, 'NULL', NULL,  DECODE(translate(:last_update,'10 -,:.','1'), null, null,:last_update)),  'yyyy-mm-dd HH24:mi:ss')"
)
