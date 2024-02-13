#!/bin/bash

# DO NOT EDIT THIS SCRIPT 
# IT WILL BE AUTOMAGICALLY GENERATED

# Orig users-240122.xlsx
# Dest users-240123.xlsx

# DESPIDOS PROCEDENTES :  
# Deleting Cesar Tomas
deluser csueca

# Deleting Angel Diseño
deluser aberlanas


# NUEVOS CONTRATOS 
useradd -m -d "/home/jguesseado" -s "/bin/bash" -u 5004 -c "Jose Guesser, ,123554422, ,timeguesser@champion.co.uk" "jguesseado"
echo "jguesseado:123554422"| chpasswd 

# MODIFICACIONES DE LOS EMPLEADOS: 

# apepino ha cambiado :
# EL NOMBRE:
chfn -f "Adrian Largo" apepino

# lautarino ha cambiado :
# EL LOGIN:
usermod -l lautarin lautarino
# EL NOMBRE:
chfn -f "Lautaro Guapeton" lautarino
# EL TELEFONO:
chfn -r "123123333" lautarino
# EL CORREO:
usermod -c "terrorismo@argentina.ar" lautarino

# vthin ha cambiado :
# EL NOMBRE:
chfn -f "Viktor Thonk" vthin

# jmarchante ha cambiado :
# EL TELEFONO:
chfn -r "445543267" jmarchante
exit 0
