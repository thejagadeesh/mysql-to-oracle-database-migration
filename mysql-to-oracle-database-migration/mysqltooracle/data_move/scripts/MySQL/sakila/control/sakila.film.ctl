load data
infile 'data/film.txt'
 "str '<EORD>'"
into table sakila.film
fields terminated by '<EOFD>'
trailing nullcols
(
description CHAR(2000000) NULLIF description = 'NULL',
film_id  NULLIF film_id = 'NULL',
language_id  NULLIF language_id = 'NULL',
last_update "TO_DATE(DECODE(:last_update, 'NULL', NULL,  DECODE(translate(:last_update,'10 -,:.','1'), null, null,:last_update)),  'yyyy-mm-dd HH24:mi:ss')",
length  NULLIF length = 'NULL',
original_language_id  NULLIF original_language_id = 'NULL',
rating CHAR(4000) "DECODE(:rating, 'NULL', NULL, NULL, ' ', :rating)",
release_year "TO_DATE(DECODE(:release_year, 'NULL', NULL,  DECODE(translate(:release_year,'10 -,:.','1'), null, null,:release_year)),  'yyyy-mm-dd HH24:mi:ss')",
rental_duration  NULLIF rental_duration = 'NULL',
rental_rate  NULLIF rental_rate = 'NULL',
replacement_cost  NULLIF replacement_cost = 'NULL',
special_features CHAR(1000) "DECODE(:special_features, 'NULL', NULL, NULL, ' ', :special_features)",
title  "DECODE(:title, 'NULL', NULL, NULL, ' ', :title)"
)
