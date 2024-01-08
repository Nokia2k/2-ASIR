#!/usr/bin/python3
# pylint: disable=unused-argument
# This program is dedicated to the public domain under the CC0 license.

"""
Simple Bot to reply to Telegram messages.

First, a few handler functions are defined. Then, those functions are passed to
the Application and registered at their respective places.
Then, the bot is started and runs until we press Ctrl-C on the command line.

Usage:
Basic Echobot example, repeats messages.
Press Ctrl-C on the command line or send a signal to the process to stop the
bot.
"""

import logging
import subprocess
import socket
import re
import netifaces
import platform
import nmap
import psutil
from ping3 import ping 

from telegram import ForceReply, Update
from telegram.ext import Application, CommandHandler, ContextTypes, MessageHandler, filters

###########################################################################################
#                                                                                         #
#                                LISTA DE COMANDOS DEL BOT                                #
#                                                                                         #
###########################################################################################

#### esto es el comando de bienvenida, no se toca y au ####

async def echo(update: Update, context: ContextTypes.DEFAULT_TYPE) -> None:
    await update.message.reply_text(update.message.text)

#### esto es el comando de bienvenida, no se toca y au ####

cont_1=0
async def start(update: Update, context: ContextTypes.DEFAULT_TYPE) -> None:
    """Send a message when the command /start is issued."""
    user = update.effective_user
    await update.message.reply_html(
        rf"Hi {user.mention_html()}!",
        reply_markup=ForceReply(selective=True),
    )
    global cont_1
    cont_1 += 1

#### esto da el hostname del dispositivo ####

cont_2=0
async def host_info(update: Update, context: ContextTypes.DEFAULT_TYPE) -> None:
    await update.message.reply_text(socket.gethostname())
    global cont_2
    cont_2 += 1
#### esto da el sistema operativo del dispositivo ####

cont_3=0
async def so_info(update: Update, context: ContextTypes.DEFAULT_TYPE) -> None:
    await update.message.reply_text(platform.platform())
    global cont_3
    cont_3 += 1
        

#### esto te dice las ip que tiene el ordenador ####

cont_4=0
lista_ip = netifaces.interfaces()
async def ip_info(update: Update, context: ContextTypes.DEFAULT_TYPE) -> None:
    lista = ''
    for interfaces in lista_ip:
        try: 
            for addrs in netifaces.ifaddresses(interfaces)[netifaces.AF_INET]:
                
                lista += "IP de la maquina: "+ interfaces+": "+addrs['addr']+"\n" 
        except:
            pass        
    await update.message.reply_text(lista)
    global cont_4
    cont_4 += 1

#### esto te da el resultado de 4 pings a una ip ####

cont_5=0
async def ping_ip(update: Update, context: ContextTypes.DEFAULT_TYPE) -> None:
    salida=""
    try:
        ip = context.args[0]
        for a in range(1,5):
            
                resultado_ping = ping(ip)
                if isinstance(resultado_ping, float):

                    resultado_ping = str(resultado_ping)
                    response = resultado_ping[4:7]
                    salida += str(ip) +" -> "+ str(response) + "ms\n"      

                elif isinstance(resultado_ping, bool):
                    salida += "IP: " + ip + " -> no response\n"
                    
                else:
                    salida +="IP: " + ip + " -> not reachable\n"
    except:
        salida = "** ERROR ** \n -> USO: /ping [IP]"

            
    await update.message.reply_text("** PING IP: " + ip+" **"+"\n\n"+salida )
    salida=""
    global cont_5
    cont_5 += 1
    
#### esto para hacer ver los error log que se han pedido ####

cont_6=0
async def log(update: Update, context: ContextTypes.DEFAULT_TYPE) -> None:
    salida = ''
    grep = 'error'
    cont = 0
    
    try:
        n = int(context.args[0])
        with open('/var/log/syslog', 'r') as logs:
            lines = logs.readlines()
            lines.reverse()
            for line in lines:
                if re.search(grep, line):
                    salida += line + "\n"
                    cont += 1
                    if cont >= n:
                        break
    except:
        salida = "** ERROR ** \n -> USO: /log [numero]"
    
    await update.message.reply_text("** Log de errores ** \n \n"+salida)
    salida=''
    global cont_6
    cont_6 += 1

#### esto para hacer ver los puertos y programas que estan en uso ####

cont_7=0
async def port(update: Update, context: ContextTypes.DEFAULT_TYPE) -> None:
    
    salida=''
    var = psutil.net_connections(kind='inet')

    for line in var:
        local = str(line.status)
        puerto = str(line.laddr.port)
        pid = line.pid
        process = psutil.Process(pid)
        pro_name = str(process.name())

        if local == "ESTABLISHED":
            salida += " * Puerto: "+ puerto + " --  "+pro_name+"\n"
    
    await update.message.reply_text("** Puertos en uso ** \n \n"+salida)
    salida = ''
    global cont_7
    cont_7 += 1

#### esto hace un nmap de la red que le diga ####

cont_8=0
async def ipred(update: Update, context: ContextTypes.DEFAULT_TYPE) -> None:
    
    salida=''
    total_ip=0
    nm = nmap.PortScanner()
    ip_probe = r'^(\d{1,3}\.){3}\d{1,3}(\/\d{1,2})?$'
    ip = context.args[0]
    if re.match(ip_probe, ip):
        try:
            
            hola = nm.scan(hosts=ip, arguments='-n -sP -PE -PA21,23,80,3389', timeout=60)
            if hola:
                hosts_list = [(x, nm[x]['status']['state']) for x in nm.all_hosts()]
                for host, status in hosts_list:
                    salida += "----\n-> " +  host + " <- \n Estado: " + status + "\n"
                    total_ip += 1
                    
        except:
            salida = "** NINGUNA IP ENCONTRADA TRAS EL ESCANEO **\n \nIP ESCANEADA: " + ip 
            
    else:
        
        salida = "Me has dado una ip incorrecta"
    
    await update.message.reply_text("** Listado IP encendidas en la red ** \n \n" + salida + "\n IP totales: " + str(total_ip))
    global cont_8
    cont_8 += 1

#### esto dice el estado del servcio que le digas ####

cont_9=0
async def service_status(update: Update, context: ContextTypes.DEFAULT_TYPE) -> None:
    # Nombre del servicio
    nom_servicio=context.args[0]
    try:
        rc = subprocess.getstatusoutput(f' systemctl status {nom_servicio} | head -3 | tr -d " " | tr -d "●" | tr - : | cut -d ":" -f1 | tr "\n" ,')
        if rc[0] == 0:
            hola = (rc[1])
            nombre = subprocess.getoutput(f'echo {hola} | cut -d "," -f1')
            active = subprocess.getoutput(f'echo {hola} | cut -d "," -f3')
            salida = "Nombre: " + nombre + "\n" + "Estado: " + active

        else:
            salida = "No se ha encontrado el servicio"
    except:
        
        salida = "El servicio esta apagado"

    await update.message.reply_text(f"** Estado del servicio: {nom_servicio} ** \n \n"+salida)
    global cont_9
    cont_9 += 1
    
#### esto arranca del servcio que le digas ####
    
cont_10=0
async def start_service(update: Update, context: ContextTypes.DEFAULT_TYPE) -> None:
    if len(context.args) < 1:
        await update.message.reply_text("Falta el argumento del servicio.")
        return

    comando = "/usr/bin/iniciar"
    argumentos = context.args[0]
    ejecutar = subprocess.run([comando,argumentos])
    salida = ejecutar.returncode        

    if salida == 0: 
        
        await update.message.reply_text(f"El servicio {argumentos} se ha iniciado correctamente")

        
    else:

        await update.message.reply_text(f" * ERROR: Ha habido un fallo a la hora de iniciar: {argumentos}")
    global cont_10
    cont_10 += 1
    
#### esto para del servcio que le digas ####

cont_11=0    
async def stop_service(update: Update, context: ContextTypes.DEFAULT_TYPE) -> None:
    if len(context.args) < 1:
        await update.message.reply_text("Falta el argumento del servicio.")
        return

    comando = "/usr/bin/parar"
    argumentos = context.args[0]
    ejecutar = subprocess.run([comando,argumentos])
    salida = ejecutar.returncode        

    if salida == 0: 
        
        await update.message.reply_text(f"El servicio {argumentos} se ha parado correctamente")
        
    else:

        await update.message.reply_text(f" * ERROR: Ha habido un fallo a la hora de parar: {argumentos}")
    
    global cont_11
    cont_11 += 1
        


#### esto da una lista de todos los comandos disponibles ####

cont_12=0
async def help_command(update: Update, context: ContextTypes.DEFAULT_TYPE) -> None:
    await update.message.reply_text(f" -- Primer bot de Telegram -- \n"
                                    f"** Instrucciones disponibles ** \n" 
                                    f"-> /start  \n"
                                    f"-> /host \n"
                                    f"-> /sys \n"
                                    f"-> /net \n"
                                    f"-> /ping [IP] \n"
                                    f"-> /log [numero]\n"
                                    f"-> /port \n"
                                    f"-> /nmap [IP RED] \n"
                                    f"-> /help \n"
                                    f"-> /service_status [servicio] \n"
                                    f"-> /start_service [servicio] \n"
                                    f"-> /stop_service [servicio] \n"
                                    f"-> /contador")
    global cont_12
    cont_12 += 1



#### esto te da un contador de la cantidad de veces que has ejecutado cada comando ####

async def contador(update: Update, context: ContextTypes.DEFAULT_TYPE) -> None:
    total=0
    salida=""
    ejecutados=""
    nom_ejecutados=[]
    cmd1=f"/start: {cont_1}" 
    cmd2=f"/host: {cont_2}"
    cmd3=f"/sys: {cont_3}"
    cmd4=f"/net: {cont_4}"
    cmd5=f"/ping [IP]: {cont_5}" 
    cmd6=f"/log [numero]: {cont_6}" 
    cmd7=f"/port: {cont_7}" 
    cmd8=f"/nmap [IP RED]: {cont_8}" 
    cmd9=f"/help: {cont_12}"
    cmd10=f"/service_status [servicio]: {cont_9}" 
    cmd11=f"/start_service [servicio]: {cont_10}"
    cmd12=f"/stop_service [servicio]: {cont_11}"
    
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
    await update.message.reply_text(f"** Contador de Instrucciones ** \n" + salida)

###########################################################################################
#                                                                                         #
#                            FIN LISTA DE COMANDOS DEL BOT                                #
#                                                                                         #
########################################################################################### 


# Enable logging
logging.basicConfig(
    format="%(asctime)s - %(name)s - %(levelname)s - %(message)s", level=logging.INFO
)
# set higher logging level for httpx to avoid all GET and POST requests being logged
logging.getLogger("httpx").setLevel(logging.WARNING)

logger = logging.getLogger(__name__)



def main() -> None:
    """Start the bot."""
    # Create the Application and pass it your bot's token.
    application = Application.builder().token("6337533931:AAG9KS63MGWowKv67Xj323GoK4gqjVZZpp8").build()

    # on different commands - answer in Telegram
    application.add_handler(CommandHandler("start", start))
    application.add_handler(CommandHandler("help", help_command))
    application.add_handler(CommandHandler("host", host_info))
    application.add_handler(CommandHandler("sys", so_info))
    application.add_handler(CommandHandler("net", ip_info))
    application.add_handler(CommandHandler("ping", ping_ip))
    application.add_handler(CommandHandler("log", log))
    application.add_handler(CommandHandler("port", port))
    application.add_handler(CommandHandler("nmap", ipred))
    application.add_handler(CommandHandler("service_status", service_status))
    application.add_handler(CommandHandler("start_service", start_service))
    application.add_handler(CommandHandler("stop_service", stop_service))
    application.add_handler(CommandHandler("contador", contador))


    # on non command i.e message - echo the message on Telegram
    application.add_handler(MessageHandler(filters.TEXT & ~filters.COMMAND, echo))

    # Run the bot until the user presses Ctrl-C
    application.run_polling(allowed_updates=Update.ALL_TYPES)


if __name__ == "__main__":
    main()
