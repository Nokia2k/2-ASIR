#!/usr/bin/python3

import sys
import math

resultado = 1
if len(sys.argv) < 2:
    print ("* ERROR")
    print ("* USO: ./script01.py NUM")
    sys.exit(1)

factorial = sys.argv[1]
try:
    factorial = float(factorial)
    if factorial.is_integer():
        if factorial < -1000 or factorial > 1000:
        
            print ("* ERROR")
            print ("* DEBE SER UN NUMERO ENTRE 1000 y -1000")
            sys.exit(1)
        
        else:

            factorial = int(factorial)
            if factorial < 0:

                factorial = abs(factorial)
                resultado = math.factorial(factorial)
                if factorial % 2 == 1:

                    resultado = resultado * -1
                    print ("El numero "+str(factorial)+" es impar a si que se aplicara un *-1")
                    print ("Resultado: "+str(resultado))

                else:

                    print ("El numero -"+str(factorial)+", se dara en valor absoluto")
                    print ("Resultado: "+str(resultado))

            else:

                resultado = math.factorial(factorial)
                print ("Resultado: "+str(resultado))


except:
    print("no es un numero")
    sys.exit(1)

sys.exit(0)
