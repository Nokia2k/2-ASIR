#!/bin/bash

ip=$1

if [ $UID = 0 ]; then

  if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
    echo "lo es"
    echo "Se comprueba el ping "
    comp_error=$( ping -c1 $ip | grep errors )
    if [ -z "$comp_error" ]; then
      echo "ip correcta"
      nmap $ip 

    else
      echo "ip con errores"
    
    fi
  else
    echo "No lo es"
  fi    
else 

  echo "No lo estas ejecutando como sudo"
fi



