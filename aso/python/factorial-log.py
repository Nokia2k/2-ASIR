#!/usr/bin/python3
import sys
import os

if os.path.exists("0000.txt"):
    print (" El fichero ya existe")
else:
    fichero = open("0000.txt",'x')

fichero = open("0000.txt",'a')

factorialtotal = 1

while factorialtotal < 1000:

    inicial = factorialtotal
    factorial = inicial
    resultado = 1

    while factorial > 1:
        resultado = resultado * factorial 
        factorial = factorial - 1


    try:
            fichero.write(" El factorial de : "+str(inicial)+" es -> "+str(resultado)+"\n")
    except:
        fichero.close()
        print(" Hemos llegado al limite en "+str(inicial-1))

        sys.exit(1)

    factorialtotal = factorialtotal+1

while factorialtotal < 6000:

    inicial = factorialtotal
    factorial = inicial
    resultado = 1

    fichero = open("0000.txt",'a')
    while factorial > 1:
        try:
            resultado = resultado * factorial 
        except:
            print(" Hemos llegado al limite en "+str(inicial-1))
            fichero.close()
            sys.exit(1)
        factorial = factorial - 1

    fichero.write(" El factorial de : "+str(inicial)+" es -> Calculable"+"\n")
    fichero.close()

    factorialtotal = factorialtotal+1

fichero.close()









sys.exit(0)
