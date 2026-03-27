
#!/bin/bash
args=("$@")
servername=${args[0]}
username=${args[1]}
password=${args[2]}

if [[ -z $password ]]; then
prompt="Provide password for $2 :" 
while IFS= read -p "$prompt" -r -s -n 1 char
do
    if [[ $char == $'\0' ]]
    then
        break
    fi
    prompt='*'
    password+="$char"
done
fi

mkdir -p log
mkdir -p data

mysqldump -h $servername -u $username -p$password  -T data --fields-terminated-by="<EOFD>" --fields-escaped-by="" --lines-terminated-by="<EORD>" "sakila" "actor" 
mysqldump -h $servername -u $username -p$password  -T data --fields-terminated-by="<EOFD>" --fields-escaped-by="" --lines-terminated-by="<EORD>" "sakila" "store" 
mysqldump -h $servername -u $username -p$password  -T data --fields-terminated-by="<EOFD>" --fields-escaped-by="" --lines-terminated-by="<EORD>" "sakila" "category" 
mysqldump -h $servername -u $username -p$password  -T data --fields-terminated-by="<EOFD>" --fields-escaped-by="" --lines-terminated-by="<EORD>" "sakila" "city" 
mysqldump -h $servername -u $username -p$password  -T data --fields-terminated-by="<EOFD>" --fields-escaped-by="" --lines-terminated-by="<EORD>" "sakila" "country" 
mysqldump -h $servername -u $username -p$password  -T data --fields-terminated-by="<EOFD>" --fields-escaped-by="" --lines-terminated-by="<EORD>" "sakila" "customer" 
mysqldump -h $servername -u $username -p$password  -T data --fields-terminated-by="<EOFD>" --fields-escaped-by="" --lines-terminated-by="<EORD>" "sakila" "film" 
mysqldump -h $servername -u $username -p$password  -T data --fields-terminated-by="<EOFD>" --fields-escaped-by="" --lines-terminated-by="<EORD>" "sakila" "film_actor" 
mysqldump -h $servername -u $username -p$password  -T data --fields-terminated-by="<EOFD>" --fields-escaped-by="" --lines-terminated-by="<EORD>" "sakila" "film_category" 
mysqldump -h $servername -u $username -p$password  -T data --fields-terminated-by="<EOFD>" --fields-escaped-by="" --lines-terminated-by="<EORD>" "sakila" "film_text" 
mysqldump -h $servername -u $username -p$password  -T data --fields-terminated-by="<EOFD>" --fields-escaped-by="" --lines-terminated-by="<EORD>" "sakila" "inventory" 
mysqldump -h $servername -u $username -p$password  -T data --fields-terminated-by="<EOFD>" --fields-escaped-by="" --lines-terminated-by="<EORD>" "sakila" "language" 
mysqldump -h $servername -u $username -p$password  -T data --fields-terminated-by="<EOFD>" --fields-escaped-by="" --lines-terminated-by="<EORD>" "sakila" "payment" 
mysqldump -h $servername -u $username -p$password  -T data --fields-terminated-by="<EOFD>" --fields-escaped-by="" --lines-terminated-by="<EORD>" "sakila" "rental" 
mysqldump -h $servername -u $username -p$password  -T data --fields-terminated-by="<EOFD>" --fields-escaped-by="" --lines-terminated-by="<EORD>" "sakila" "staff" 
mysqldump -h $servername -u $username -p$password  -T data --fields-terminated-by="<EOFD>" --fields-escaped-by="" --lines-terminated-by="<EORD>" "sakila" "address" 

