load data
infile 'data/film_text.txt'
 "str '<EORD>'"
into table sakila.film_text
fields terminated by '<EOFD>'
trailing nullcols
(
description CHAR(2000000) NULLIF description = 'NULL',
film_id  NULLIF film_id = 'NULL',
title CHAR(255) "DECODE(:title, 'NULL', NULL, NULL, ' ', :title)"
)
