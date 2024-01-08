#!/usr/bin/python3
import sys
import subprocess


# Nombre del servicio de Apache2
nom_servicio=sys.argv[1]

    # Iniciar el servicio Apache2
rc = subprocess.getstatusoutput(f' systemctl status {nom_servicio} | head -3 | tr -d " " | tr -d "●" | tr - : | cut -d ":" -f1 | tr "\n" ,')
if rc[0] == 0:
    hola = (rc[1])
    print(hola)
    nombre = subprocess.getoutput(f'echo {hola} | cut -d "," -f1')
    loaded = subprocess.getoutput(f'echo {hola} | cut -d "," -f2')
    active = subprocess.getoutput(f'echo {hola} | cut -d "," -f3')
    print("Nombre del servicio: " + nombre)
    print("Modo de servicio: " + loaded)
    print("Estado del servicio: " + active)

else:
    print("No se ha encontrado el servicio")
