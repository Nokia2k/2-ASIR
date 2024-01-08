#!/usr/bin/python3

import sys
import math

nombre_archivo= "0000.txt"
archivo_resultados = open(nombre_archivo, "w")
factorial = 1

if len(sys.argv) > 1:
    print ("* ERROR")
    print ("* USO: ./script02.py")
    sys.exit(1)


while True:
    resultado = math.factorial(factorial)
    try:
        if factorial < 1000:
            if factorial % 2 == 1:
                
                resultado = resultado * -1
                archivo_resultados.write(
                    f"El numero {factorial} es impar a si que se aplicara un *-1:\nResultado:{resultado}\n---\n"
                )
        
            else:
        
                archivo_resultados.write(
                    f"El numero {factorial} es par:\nResultado:{resultado}\n---\n"
                )
            
        else:

            archivo_resultados.write(
                f"El numero: {factorial} ha sido capaz de calcularlo\n---\n"
            )
            

    except:

        print ("El numero: "+str(factorial)+" no ha sido capaz de calcularlo, cerrando el script")
        sys.exit(0)
        
    factorial = factorial + 1

archivo_resultados.close()
sys.exit(0)
