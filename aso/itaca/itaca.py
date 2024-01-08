#!/usr/bin/python3

import sys
import subprocess
import os
from os import remove
import os.path as path
import urllib.request
import gzip
import re

cont = 0
i_cont = 0
mirror_url = "http://lliurex.net/"
distro = "focal"
packages_gz_file = mirror_url+distro+"/dists/focal-updates/main/binary-amd64/Packages.gz"
package_name="itaca"
ruta = "/tmp/"
archivo = "Packages.gz"
deb_itaca = "itaca.deb"

print( "* Welcome to the Itaca Installer" )

if os.geteuid() != 0:
    print ("Debes tener privilegios root para este script.")
    sys.exit(1)
    
#### Aqui compruebo que el paquete de itaca no esta instalado,
#### en caso de que lo este pregunte si desea continuar

rc = subprocess.getstatusoutput('dpkg -l | tr -s " " | cut -d " " -f2 | grep itaca$')

if rc[0] == 0:
    print( " * El paquete Itaca esta instalado")
    ask = input('  * ¿Deseas continuar?: ') 
    if ask == "n": 
        print ( "* Saliendo ...")
        sys.exit(1)

if rc[0] != 0:
    print (" * El paquete Itaca no esta instalado")
    print ( " * Descargando paquete instalador de Itaca" )

#### Aqui nos descargamos el archivo .gz donde esta el nombre de itaca
#### para poder descargarlo del repositorio junto con su hash para comprobar 
#### mas tarde unas cosas

#### tambien vamos leyendo el fichero linea por linea hasta encontrar:
#### Package, Filename, SHA256

urllib.request.urlretrieve(packages_gz_file, ruta+archivo)

print (" * Paquete descargado, buscando Itaca")

with gzip.open(ruta+archivo, "rb") as f_in:
    with open(ruta+"Packages", "wb") as f_out:
        f_out.write(f_in.read())

with open (ruta+"Packages", "r") as buscar:
    for line in buscar:
        if re.search("Package: "+package_name, line):
            i_cont=cont 
                           
        if cont == i_cont +10 and cont > 10:
            url_itaca = line.split(":")[1]
            url_itaca = url_itaca.strip()
            pkg_dwnld=(mirror_url+distro+"/"+url_itaca)
        
        if cont == i_cont +12 and cont > 12:
            hash_itaca = line.split(":")[1]
            hash_itaca = hash_itaca.strip()
        
        cont =  cont + 1
            
print(" * Paquete Itaca encontrado, descargandolo...")     
        
#### Aqui comprobamos si el .deb de itaca que nos hemos descargado ya existe
#### y si es asi le preguntamos si queremos reinstalarlo o no        

if (path.exists(ruta+deb_itaca)):
    print( "* WARNING: The current package already exists")
    ask= input( "* DO YO WANT TO REDOWNLOAD THE PACKAGE? (y/n): ")
    if ask == "n":
        print("EXITING...")
        sys.exit(0)
    else:
        print( " * REDOWNLOADING THE CURRENT PACKAGE")
        remove(ruta+deb_itaca)
        
urllib.request.urlretrieve(pkg_dwnld, ruta+deb_itaca)

#### Aqui hacemos una comparacion de los hash para saber si lo que 
#### hemos descargado es el fichero correcto para posteriormente instalarlo

hash_dwnld = subprocess.getstatusoutput('sha256sum /tmp/itaca.deb | cut -d " " -f1')

if hash_itaca == hash_dwnld[1]:

    try:
        print("* INSTALLING THE ITACA PACKAGE")
        cmd_dpkg = f"dpkg -i {ruta+deb_itaca}"
        os.system(cmd_dpkg)
        print(" * ITACA IS SUCCESFULLY INSTALLED")
    except:
        print(" * SOMETHING WENT WRONG, EXITING...")
        sys.exit(1)
else:
    
    print(" * SOMETHING WENT WRONG, EXITING... ss")
    sys.exit(1)                

sys.exit(0)




            
