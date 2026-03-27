load data
infile 'data/film_actor.txt'
 "str '<EORD>'"
into table sakila.film_actor
fields terminated by '<EOFD>'
trailing nullcols
(
actor_id  NULLIF actor_id = 'NULL',
film_id  NULLIF film_id = 'NULL',
last_update "TO_DATE(DECODE(:last_update, 'NULL', NULL,  DECODE(translate(:last_update,'10 -,:.','1'), null, null,:last_update)),  'yyyy-mm-dd HH24:mi:ss')"
)
