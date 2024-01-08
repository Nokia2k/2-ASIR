#!/usr/bin/python3

import sys
import netifaces

lista_interfaces = netifaces.interfaces()

for interfaces in lista_interfaces:
    try: 
        for addrs in netifaces.ifaddresses(interfaces)[netifaces.AF_INET]:
        
            print (interfaces+": "+addrs['addr'])
    except:
            print(interfaces+": Desconocida")

sys.exit(0)