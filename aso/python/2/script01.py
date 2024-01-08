#!/usr/bin/python3

import os
import sys
import re 

with open( "/etc/passwd", "r" ) as passwd:
    for line in passwd:
   
        grep = str(os.getuid())

        if os.getuid() < 1000:
        
            print ("No creo que esto sea buena idea")
            print ("Saliendo")
            sys.exit(1)

        else:
        
            for line in passwd:
                if re.search(grep, line): 
                    GECOS = line.split(":")[4]
                    print ("UID del usuario en cuestion: "+str(os.getuid())) 
                    print ("Los GECOS del ususario en cuestion: "+str(GECOS))

        path = os.path.expanduser('~')
        print ("La ruta de la carpeta personal es: "+str(path))
        try:
            ps1 = os.environ.get('PS1')
            print ("El PS1 del entorno es: "+str(ps1))
        except:
            print ("adfja")
