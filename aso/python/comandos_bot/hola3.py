#!/usr/bin/python3

import psutil

var = psutil.net_connections(kind='inet')

for line in var:
    local = line.status
    puerto = line.laddr.port
    pid = line.pid
    process = psutil.Process(pid)
    pro_name = process.name()


    if local == "ESTABLISHED":
        print (local, puerto, pro_name)

