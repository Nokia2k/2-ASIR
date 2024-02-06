#!/bin/bash
initial () {
  clear
  if [ $flag -eq 1 ]; then
    echo -n "Selecione un codigo correcto"
  elif [ $flag -eq 2 ]; then
    echo -n "Importe no valido"
  fi
  sleep 1
  clear
  echo "$maquina"
  echo "Bienvenido a Starfood 24H"
  echo -n "Escriba codigo de producto:"
  read producto
}
maquina=$(cat 'ascii maquina')

echo "$maquina"
echo "Bienvenido a Starfood 24H"
echo -n "Escriba codigo de producto: "
read producto
producto=$(echo $producto | tr -d "0")
producto=$(echo "0$producto")
flag="1"

while [ "$flag" -eq 1 ]; do
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
      val=1.30
      flag=0
    ;;

    03)
      producto="ToroLoco Coco"
      precio="1,20€"    
      val=1.20
      flag=0
    ;;

    04)
      producto="Aquarius Naranja"
      precio="1,40€"    
      val=1.40
      flag=0
    ;;

    05)
      producto="Kinder Bueno Blanco"
      precio="1,60€"    
      val=1.60
      flag=0
    ;;

    06)
      producto="Mars Nacional"
      precio="0,90€"    
      val=0.90
      flag=0
    ;;

    07)
      producto="Oreo Original"
      precio="1,20€"    
      val=1.20
      flag=0
    ;;

    08)
      producto="Kinder Bueno"
      precio="1,60€"
      val="1,60"    
      flag=0
    ;;

    *)
      flag=1
      initial
    ;;
  esac
done
if [ $flag -eq 0 ]; then
  echo "$producto, precio: $precio"
  echo -n "Porfavor, introduzca el dinero: "
  read dinero
  dinero=$( echo $dinero | tr -d "," | tr -d "." | tr -d "€")
  if [ $dinero -lt $val ]; then
    flag=2
    initial
  fi
  devolver=$( calc $dinero - $val )
  echo $devolver
fi
exit 0
