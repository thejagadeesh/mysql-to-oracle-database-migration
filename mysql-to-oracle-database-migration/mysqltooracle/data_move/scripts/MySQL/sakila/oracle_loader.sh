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
sqlplus $username/$password@$tnsname  < control/pre_load.sql

sqlldr $username/$password@$tnsname control=control/sakila.actor.ctl log=log/sakila.actor.log
sqlldr $username/$password@$tnsname control=control/sakila.store.ctl log=log/sakila.store.log
sqlldr $username/$password@$tnsname control=control/sakila.category.ctl log=log/sakila.category.log
sqlldr $username/$password@$tnsname control=control/sakila.city.ctl log=log/sakila.city.log
sqlldr $username/$password@$tnsname control=control/sakila.country.ctl log=log/sakila.country.log
sqlldr $username/$password@$tnsname control=control/sakila.customer.ctl log=log/sakila.customer.log
sqlldr $username/$password@$tnsname control=control/sakila.film.ctl log=log/sakila.film.log
sqlldr $username/$password@$tnsname control=control/sakila.film_actor.ctl log=log/sakila.film_actor.log
sqlldr $username/$password@$tnsname control=control/sakila.film_category.ctl log=log/sakila.film_category.log
sqlldr $username/$password@$tnsname control=control/sakila.film_text.ctl log=log/sakila.film_text.log
sqlldr $username/$password@$tnsname control=control/sakila.inventory.ctl log=log/sakila.inventory.log
sqlldr $username/$password@$tnsname control=control/sakila.language.ctl log=log/sakila.language.log
sqlldr $username/$password@$tnsname control=control/sakila.payment.ctl log=log/sakila.payment.log
sqlldr $username/$password@$tnsname control=control/sakila.rental.ctl log=log/sakila.rental.log
sqlldr $username/$password@$tnsname control=control/sakila.staff.ctl log=log/sakila.staff.log
sqlldr $username/$password@$tnsname control=control/sakila.address.ctl log=log/sakila.address.log

sqlplus $username/$password@$tnsname < control/post_load.sql
