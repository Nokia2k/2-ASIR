#!/usr/bin/python3

import sys
import os
import shutil
import random

gente = ["Adrian", "Lautaro", "David", "Jesus", "Victor", "Jose"]

path = os.path.expanduser('~')
path = str(path)+"/investigacion"
if os.path.exists(path):
    ask = input ("Quieres borrar la carpeta investigacion? ")
    if ask == "si":
        try:
            shutil.rmtree(path)
            print ("Carpeta borrada")
        except:
            print ("algo ha ido mal...")
            sys.exit(1)
    elif ask == "no":
        print ("Pues no se borra la carpeta")
        sys.exit(0)
    else:
        print ("* ERROR: Opcion invalida")
        print ("* Unicas opciones disponibles: si - no")

else:
    
    os.mkdir(path)
    print ("Carpeta investigacion creada")
    sos_path = os.path.join(path, "sospechosos")
    inv_path = os.path.join(path, "investigados")
    os.mkdir(sos_path)
    os.mkdir(inv_path)
    print ("Carpertas sospechosos y investigados creados")
    
    for crear in gente:
        personas = os.path.join(sos_path, f"{crear}.tkn")
        numero = random.randint(1,6)
        with open(personas, "w") as archivo:
            archivo.write(str(numero))
        if numero % 2 == 0:
            personas_lnk = os.path.join(inv_path, f"{crear}.tkn")
            os.symlink(personas, personas_lnk)
