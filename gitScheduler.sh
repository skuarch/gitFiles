#!/bin/bash

FILE="target/dsat_template.war"
USER="admin"
PASSWORD="admin"
HOST="localhost"
PORT=8080

while true; do
    
  [ $(git rev-parse HEAD) = $(git ls-remote $(git rev-parse --abbrev-ref @{u} | \
  sed 's/\// /g') | cut -f1) ] && echo up to date || echo git pull; break;
  sleep 1m
   
done

## deploy to tomcat
curl --upload-file $FILE "http://$USER:$PASSWORD@$HOST:$PORT/manager/deploy?path=/debug&update=true"
