total=0
salida=""
ejecutados=""
nom_ejecutados=[]
cmd1=f"/start: 1 " 
cmd2=f"/host: 2 "
cmd3=f"/sys: 1 "
cmd4=f"/net: 2"
cmd5=f"/ping [IP]: 0 " 
cmd6=f"/log [numero]: 1" 
cmd7=f"/port: 0" 
cmd8=f"/nmap [IP RED]: 0" 
cmd9=f"/help: 3"
cmd10=f"/service_status [servicio]: 0" 
cmd11=f"/start_service [servicio]: 2"
cmd12=f"/stop_service [servicio]: 0"

for comandos in (cmd1, cmd2, cmd3, cmd4, cmd5, cmd6, cmd7, cmd8, cmd9, cmd10, cmd11, cmd12):
    veces_ejec = int(comandos.split(":")[1])
    total = veces_ejec + total
    if veces_ejec > 0:
        nom_ejecutados.append(comandos)
        
for comandos_ejecutados in (nom_ejecutados):
    ejecutados = str(comandos_ejecutados.split(":")[1])
    nombres = str(comandos_ejecutados.split(":")[0])
    porcentaje_1 = int(ejecutados) * 100 
    porcentaje = porcentaje_1 / total
    salida += nombres + ": "+ "%.2f" % porcentaje+"%\n"


