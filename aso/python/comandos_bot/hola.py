#!/usr/bin/python3

import re
import nmap
import sys

nm = nmap.PortScanner()
ip = sys.argv[1]


ip_probe = r'^(\d{1,3}\.){3}\d{1,3}(\/\d{1,2})?$'

if re.match(ip_probe,ip):

    hola = nm.scan(hosts=ip, arguments='-n -sP -PE -PA21,23,80,3389')
    if hola:
        hosts_list = [(x, nm[x]['status']['state']) for x in nm.all_hosts()]
        for host, status in hosts_list:
            print(host + status)
else:
    
    print("Me has dado una ip incorrecta")