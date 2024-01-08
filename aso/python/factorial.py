#!/usr/bin/python3

import sys

print(" * Comprobacion maximo numero factorial ")
factorial = 1
resultado = 1

while True:
    try:
        resultado = resultado * factorial
        factorial = factorial + 1
        #print (str(resultado))
    except OverflowError:
        break

resultado = resultado - 1

print ( "hola:"+str(factorial) )

sys.exit(0)
