
set servername=%1
set username=%2
set password=%3

IF '%password%'=='' (
  set /p password=Enter password for user %2:
)

mkdir log
mkdir data

mysqldump -h %servername% -u %username% -p%password%  -T data --fields-terminated-by="<EOFD>" --fields-escaped-by="" --lines-terminated-by="<EORD>" "sakila" "actor" 
mysqldump -h %servername% -u %username% -p%password%  -T data --fields-terminated-by="<EOFD>" --fields-escaped-by="" --lines-terminated-by="<EORD>" "sakila" "store" 
mysqldump -h %servername% -u %username% -p%password%  -T data --fields-terminated-by="<EOFD>" --fields-escaped-by="" --lines-terminated-by="<EORD>" "sakila" "category" 
mysqldump -h %servername% -u %username% -p%password%  -T data --fields-terminated-by="<EOFD>" --fields-escaped-by="" --lines-terminated-by="<EORD>" "sakila" "city" 
mysqldump -h %servername% -u %username% -p%password%  -T data --fields-terminated-by="<EOFD>" --fields-escaped-by="" --lines-terminated-by="<EORD>" "sakila" "country" 
mysqldump -h %servername% -u %username% -p%password%  -T data --fields-terminated-by="<EOFD>" --fields-escaped-by="" --lines-terminated-by="<EORD>" "sakila" "customer" 
mysqldump -h %servername% -u %username% -p%password%  -T data --fields-terminated-by="<EOFD>" --fields-escaped-by="" --lines-terminated-by="<EORD>" "sakila" "film" 
mysqldump -h %servername% -u %username% -p%password%  -T data --fields-terminated-by="<EOFD>" --fields-escaped-by="" --lines-terminated-by="<EORD>" "sakila" "film_actor" 
mysqldump -h %servername% -u %username% -p%password%  -T data --fields-terminated-by="<EOFD>" --fields-escaped-by="" --lines-terminated-by="<EORD>" "sakila" "film_category" 
mysqldump -h %servername% -u %username% -p%password%  -T data --fields-terminated-by="<EOFD>" --fields-escaped-by="" --lines-terminated-by="<EORD>" "sakila" "film_text" 
mysqldump -h %servername% -u %username% -p%password%  -T data --fields-terminated-by="<EOFD>" --fields-escaped-by="" --lines-terminated-by="<EORD>" "sakila" "inventory" 
mysqldump -h %servername% -u %username% -p%password%  -T data --fields-terminated-by="<EOFD>" --fields-escaped-by="" --lines-terminated-by="<EORD>" "sakila" "language" 
mysqldump -h %servername% -u %username% -p%password%  -T data --fields-terminated-by="<EOFD>" --fields-escaped-by="" --lines-terminated-by="<EORD>" "sakila" "payment" 
mysqldump -h %servername% -u %username% -p%password%  -T data --fields-terminated-by="<EOFD>" --fields-escaped-by="" --lines-terminated-by="<EORD>" "sakila" "rental" 
mysqldump -h %servername% -u %username% -p%password%  -T data --fields-terminated-by="<EOFD>" --fields-escaped-by="" --lines-terminated-by="<EORD>" "sakila" "staff" 
mysqldump -h %servername% -u %username% -p%password%  -T data --fields-terminated-by="<EOFD>" --fields-escaped-by="" --lines-terminated-by="<EORD>" "sakila" "address" 

