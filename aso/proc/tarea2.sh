#!/bin/bash

cont=$( docker ps -a ) && echo "$cont" > archivo
echo "| Nombre del contenedor | IP Red |"

while read line; do

  cont_up=$(echo "$line" | awk '{print $7}')  
  if [ $cont_up = "Up" ]; then
    
    #echo $line    
    name_cont=$( echo $line | tr " " "-" | cut -d "-" -f12)
    ip_cont=$(docker inspect $name_cont | grep  'IPAddress": "' | head -1 | tr -d " " | cut -d ":" -f2 | tr -d '"' | tr -d ",")
    
    echo "| $name_cont | $ip_cont |"
  
  fi
  done < "archivo"
  rm archivo

exit 0
