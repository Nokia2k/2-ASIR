#!/usr/bin/python3

import sys
resultado = 1

print(" * Calcular factorial ")
factorial = sys.argv[1]

if factorial < 0:
    
    #print ("no es un numero")
    #sys.exit(1)
#else:
    factorial = int(factorial)
    #if factorial < 0 : 
    print ("el numero es negativo")
    sys.exit(0)

    while factorial > 1:
        resultado = resultado * factorial
        factorial = factorial - 1
        

#resultado = resultado - 1

print ( "hola:"+str(resultado) )

sys.exit(0)
