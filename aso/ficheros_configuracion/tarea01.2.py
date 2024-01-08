#!/usr/bin/python3

import sys
import os
import re

sha_f = open("/etc/shadow", "r")
pass_f = open("/etc/passwd", "r")
numLinea_p = 0
numLinea_s = 0

for linea in pass_f:
    
    numLinea_p = numLinea_p+1
    arrayLinea = linea.split(':')
    shell = arrayLinea[6].strip()
    usuario = arrayLinea[0].strip()
                  
    if shell == "/bin/bash" or shell == "/bin/ksh" or shell == "/bin/sh" or shell == "/bin/ksh" or shell == "/bin/dash":      
               
        for linea in sha_f:

            numLinea_s = numLinea_p
            arrayLinea = linea.split(':')
            passwd = arrayLinea[1].strip()
            usuario = arrayLinea[0].strip()
            if passwd == "*" or passwd == "!":
                False
            else:
                print("Usuario logable: "+ usuario + " ------> hash: " +passwd)
        

pass_f.close()
sha_f.close()

sys.exit(0)

