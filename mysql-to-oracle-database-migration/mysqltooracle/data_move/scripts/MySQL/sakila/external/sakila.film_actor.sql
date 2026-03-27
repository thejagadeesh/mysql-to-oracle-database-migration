CREATE TABLE sakila.film_actor_ext (
  "ACTOR_ID" NUMBER(5,0),
  "FILM_ID" NUMBER(5,0),
  "LAST_UPDATE" DATE)
ORGANIZATION EXTERNAL
(TYPE oracle_loader
DEFAULT DIRECTORY sakila_data_dir
ACCESS PARAMETERS (
RECORDS DELIMITED BY '<EORD>'
BADFILE sakila_log_dir:'sakila.film_actor.bad'
LOGFILE sakila_log_dir:'sakila.film_actor.log'
FIELDS TERMINATED BY '<EOFD>'
MISSING FIELD VALUES ARE NULL
("ACTOR_ID", 
"FILM_ID", 
"LAST_UPDATE" CHAR date_format TIMESTAMP mask "yyyy-mm-dd HH24:mi:ss.ff3"
))
LOCATION ('film_actor.txt'))
REJECT LIMIT UNLIMITED;

INSERT into sakila.film_actor (SELECT * from sakila.film_actor_ext);
commit;

-- drop table sakila.film_actor_ext;

