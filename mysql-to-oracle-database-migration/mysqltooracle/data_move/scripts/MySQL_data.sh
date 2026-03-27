#!/bin/bash
if [[ $# -lt 2 ]]; then
   echo "Usage: sh MySQL_data.sh servername username password"
   exit 1;
fi

( cd MySQL ; sh MySQL_data.sh  $@ )

