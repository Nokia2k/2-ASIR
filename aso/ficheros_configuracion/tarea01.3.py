#!/usr/bin/python3

import sys
import os
import re

pass_f = open("/etc/passwd", "r")

for linea in pass_f:
    
    arrayLinea = linea.split(':')
    id_usr = arrayLinea[2].strip()
    usuario = arrayLinea[0].strip()
    dir_personal = arrayLinea[5].strip()
    if int(id_usr) > 1000:    
        if os.path.isdir(dir_personal):
            print(usuario+":"+id_usr+":"+dir_personal)
        else:
            print(usuario+":"+id_usr+": SIN HOME")
pass_f.close()

