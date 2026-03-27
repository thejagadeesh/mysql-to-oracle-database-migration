#!/bin/bash
if [[ $# -lt 1 ]]; then
echo "Usage: oracle_loader <servicename> <user> <password> [<nls_date_format>]";
exit 1;
fi

args=("$@")
tnsname=${args[0]}
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

if [[ $4 ]]; then
  export NLS_DATE_FORMAT=$4
fi

if [[ ! $NLS_DATE_FORMAT ]]; then
 export NLS_DATE_FORMAT='yyyy-mm-dd HH24:mi:ss'
fi

#export NLS_TIMESTAMP_FORMAT='Mon dd YYYY HH:mi:ffAM'
#export NLS_LANGUAGE=<insert the language of your database here e.g., US7ASCII>
sqlplus $username/$password@$tnsname  < external/pre_load.sql

sqlplus $username/$password@$tnsname < external/sakila.actor.sql 
sqlplus $username/$password@$tnsname < external/sakila.store.sql 
sqlplus $username/$password@$tnsname < external/sakila.category.sql 
sqlplus $username/$password@$tnsname < external/sakila.city.sql 
sqlplus $username/$password@$tnsname < external/sakila.country.sql 
sqlplus $username/$password@$tnsname < external/sakila.customer.sql 
sqlplus $username/$password@$tnsname < external/sakila.film.sql 
sqlplus $username/$password@$tnsname < external/sakila.film_actor.sql 
sqlplus $username/$password@$tnsname < external/sakila.film_category.sql 
sqlplus $username/$password@$tnsname < external/sakila.film_text.sql 
sqlplus $username/$password@$tnsname < external/sakila.inventory.sql 
sqlplus $username/$password@$tnsname < external/sakila.language.sql 
sqlplus $username/$password@$tnsname < external/sakila.payment.sql 
sqlplus $username/$password@$tnsname < external/sakila.rental.sql 
sqlplus $username/$password@$tnsname < external/sakila.staff.sql 
sqlplus $username/$password@$tnsname < external/sakila.address.sql 

sqlplus $username/$password@$tnsname < external/post_load.sql
