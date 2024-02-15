#!/bin/bash
#set -
clear
maquina=$(cat 'ascii maquina')

echo "$maquina"
echo "Bienvenido a Starfood 24H"
read -p "Escriba codigo de producto: " producto
producto=$(echo $producto | tr -d "0")
producto=$(echo "0$producto")
flag="1"

case $producto in

  01)
    producto="Monster Original"
    precio="2,10€"    
    val=210
    flag=0
  ;;
  02)
    producto="ChocoBons"
    precio="1,30€"    
    val=130
    flag=0
  ;;
  03)
    producto="ToroLoco Coco"
    precio="1,20€"    
    val=120
    flag=0
  ;;
  04)
    producto="Aquarius Naranja"
    precio="1,40€"    
    val=140
    flag=0
  ;;
  05)
    producto="Kinder Bueno Blanco"
    precio="1,60€"    
    val=160
    flag=0
  ;;
  06)
    producto="Mars Nacional"
    precio="0,90€"    
    val=090
    flag=0
  ;;
  07)
    producto="Oreo Original"
    precio="1,20€"    
    val=120
    flag=0
  ;;
  08)
    producto="Kinder Bueno"
    precio="1,60€"
    val=160    
    flag=0
  ;;
   *)
    flag=1
  ;;
esac

if [ $flag -eq 0 ]; then
  echo "$producto, precio: $precio"
  read -p "Porfavor, introduzca el importe en euros: " dinero
  dinero=$( echo $dinero | tr -d "," | tr -d "." | tr -d "€")
  if [ $dinero -lt $val ]; then
    echo "importe no valido"
    sleep 1
    exit 1
  fi
  devolver=$( calc $dinero - $val )
  devolver=$( echo $devolver | tr -d " ")
  devolver=$( calc $devolver / 100 )
  devolver=$( echo $devolver | tr -d " ")
  if [ $dinero -gt $val ]; then
    echo "Devolviendo cambio: $devolver€"
    echo "Muchas gracias por comprar en StarFood 24H"
  fi
  if [ $dinero -eq $val ]; then
    echo "Muchas gracias por comprar en StarFood 24H"
  fi
  else 
    echo "Selecione un codigo correcto"
    sleep 2
    exit 1
fi
exit 0
