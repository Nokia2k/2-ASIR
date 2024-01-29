# FIREWALL con DMZ
*Victor Martinez Martinez*

---

### PUNTO 1, 2, 3 y 4: 
#### CONFIGURANDO EL EQUIPO LINUX COMO ROUTER
Reconfiguraremos el router para que tenga una tarjeta de red mas y asi poder agregar al equipo la red de la DMZ, en mi caso tendra la red de **192.168.212.0/24**

**LIMPIANDO LAS IPTABLES:**
```bash
iptables -F
iptables -t nat -F 
```
**HACER QUE TODAS LAS NORMAS ESTEN EN DROP:**
```bash
iptables -p INPUT DROP
iptables -p OUTPUT DROP
iptables -p FORWARD DROP
```

**PERMITIR TRAFICO DE RETORNO Y CONEXIONES ESTABLECIDAS:**
```bash
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
```

**ENRUTAMIENDO DE LA RED:**
```bash
iptables -t nat -A POSTROUTING -s 192.168.212.0/24 -o enp0s3 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 192.168.222.0/24 -o enp0s3 -j MASQUERADE
```     
---

### PUNTO 5:
#### SOLO los empleados deben tener acceso a paginas web, usar el correo electronico (IMAP y POP3) y realizar pings  estar:

**CONSULTAR PAGINAS WEB:** 
Para el puerto **80**:
```bash
iptables -A FORWARD -p tcp --dport 80 -m iprange --src-range 192.168.222.100-192.168.222.150 -j ACCEPT
iptables -A FORWARD -p tcp --sport 80 -m iprange --src-range 192.168.222.100-192.168.222.150 -j ACCEPT
```
Para el puerto **443**:
```bash
iptables -A FORWARD -p tcp --dport 443 -m iprange --src-range 192.168.222.100-192.168.222.150 -j ACCEPT
iptables -A FORWARD -p tcp --sport 443 -m iprange --src-range 192.168.222.100-192.168.222.150 -j ACCEPT
```
Para permitir los **dns**:
```bash
iptables -A FORWARD -p tcp --dport 53 -m iprange --src-range 192.168.222.100-192.168.222.150 -j ACCEPT
iptables -A FORWARD -p udp --sport 53 -m iprange --src-range 192.168.222.100-192.168.222.150 -j ACCEPT
iptables -A FORWARD -p tcp --dport 53 -m iprange --src-range 192.168.222.100-192.168.222.150 -j ACCEPT
iptables -A FORWARD -p udp --sport 53 -m iprange --src-range 192.168.222.100-192.168.222.150 -j ACCEPT
```

**Utlizar el correo electronico (POP3, IMAP y SMTP ):** 
Para POP3 y TLS POP3:
```bash
iptables -A OUTPUT -p tcp --dport 110 -m iprange --src-range 192.168.222.100-192.168.222.150 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 995 -m iprange --src-range 192.168.222.100-192.168.222.150 -j ACCEPT

iptables -A FORWARD -p tcp --dport 110 -d *.*.*.* -m iprange --src-range 192.168.222.100-192.168.222.150 -j ACCEPT
iptables -A FORWARD -p tcp --dport 995 -d *.*.*.* -m iprange --src-range 192.168.222.100-192.168.222.150 -j ACCEPT
```
Para IMAP y TLS IMAP:
```bash
iptables -A OUTPUT -p tcp --dport 143 -m iprange --src-range 192.168.222.100-192.168.222.150 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 993 -m iprange --src-range 192.168.222.100-192.168.222.150 -j ACCEPT

iptables -A FORWARD -p tcp --dport 143 -d *.*.*.* -m iprange --src-range 192.168.222.100-192.168.222.150 -j ACCEPT
iptables -A FORWARD -p tcp --dport 993 -d *.*.*.* -m iprange --src-range 192.168.222.100-192.168.222.150 -j ACCEPT
```
PARA SMTP Y SMTPS:
```bash
iptables -A OUTPUT -p tcp --dport 25 -m iprange --src-range 192.168.222.100-192.168.222.150 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 587 -m iprange --src-range 192.168.222.100-192.168.222.150 -j ACCEPT

iptables -A FORWARD -p tcp --dport 25 -d *.*.*.* -m iprange --src-range 192.168.222.100-192.168.222.150 -j ACCEPT
iptables -A FORWARD -p tcp --dport 587 -d *.*.*.* -m iprange --src-range 192.168.222.100-192.168.222.150 -j ACCEPT
```

**REALIZAR PINGS:**
```bash 
iptables -A INPUT -p icmp --icmp-type echo-request -m iprange --src-range 192.168.222.100-192.168.222.150 -j ACCEPT
iptables -A OUTPUT -p icmp --icmp-type echo-reply -m iprange --src-range 192.168.222.100-192.168.222.150 -j ACCEPT

iptables -A FORWARD -p icmp --icmp-type echo-request -m iprange --src-range 192.168.222.100-192.168.222.150 -j ACCEPT
iptables -A FORWARD -p icmp --icmp-type echo-reply -m iprange --src-range 192.168.222.100-192.168.222.150 -j ACCEPT

```

### PUNTO 6 y 7:
#### Todos los equipos de la LAN deben poder acceder a los servicios ofrecidos en la DMZ.
```bash 
iptables -A FORWARD -s 192.168.222.0/24 -d 192.168.212.0/24 -j ACCEPT
iptables -A FORWARD -s 192.168.222.0/24 -d 192.168.212.0/24 -m state --state ESTABLISHED,RELATED -j ACCEPT
```

#### Los servidores de dentro de la LAN también podrán consultar páginas web (ya que esos puertos también se utilizan para actualizaciones).
```bash
iptables -A FORWARD -s 192.168.222.0/24 -p tcp --dport 80 -j ACCEPT
iptables -A FORWARD -s 192.168.222.0/24 -p tcp --sport 80 -j ACCEPT
iptables -A FORWARD -s 192.168.222.0/24 -p tcp --dport 443 -j ACCEPT
iptables -A FORWARD -s 192.168.222.0/24 -p tcp --sport 443 -j ACCEPT
```

### PUNTO 8:
#### El servidor de tiempo será el único equipo de la LAN que pueda hacer consultas NTP al exterior. 
```bash
iptables -A OUTPUT -p udp --dport 123 -s 192.168.222.222 -j ACCEPT
```
---

### PUNTO 9:
#### El equipo interno del administrador debe ser el único que pueda conectarse al equipo que contiene el firewall. Se conectará por SSH.
```bash
iptables -A INPUT -p tcp --dport 22 -s 192.168.222.99 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 22 -s 192.168.222.99 -j ACCEPT
```
---

### PUNTO 10: 
#### El administrador (192.168.2.254) de la red debe poder acceder desde su casa por SSH al router, a su equipo dentro de la LAN y a los 3 servidores

**ROUTER:**
```bash
iptables -A INPUT -p tcp --dport 22 -s 192.168.222.1 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 22 -s 192.168.222.1 -j ACCEPT
```
#### RED INTERNA:
**ADMINISTRADOR:**
```bash       
iptables -A INPUT -p tcp --dport 22 -s 192.168.222.99 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 22 -d 192.168.222.99 -j ACCEPT
iptables -t nat -A PREROUTING -p tcp --dport 2222 -j DNAT --to-destination 192.168.222.99:22
```

**MARIADB:**
```bash
iptables -A INPUT -p tcp --dport 22 -s 192.168.222.200 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 22 -d 192.168.222.200 -j ACCEPT
iptables -t nat -A PREROUTING -p tcp --dport 2233 -j DNAT --to-destination 192.168.222.200:22
```

**TIEMPO:**
```bash
iptables -A INPUT -p tcp --dport 22 -s 192.168.222.222 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 22 -d 192.168.222.222 -j ACCEPT
iptables -t nat -A PREROUTING -p tcp --dport 2255 -j DNAT --to-destination 192.168.222.222:22
```
#### DMZ:

**APACHE-EXTERNO:**
```bash
iptables -A INPUT -p tcp --dport 22 -s 192.168.212.100 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 22 -d 192.168.212.100 -j ACCEPT
iptables -t nat -A PREROUTING -p tcp --dport 2244 -j DNAT --to-destination 192.168.212.100:22
```

**APACHE-INTRA:**
```bash
iptables -A INPUT -p tcp --dport 22 -s 192.168.212.200 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 22 -d 192.168.212.200 -j ACCEPT
iptables -t nat -A PREROUTING -p tcp --dport 2244 -j DNAT --to-destination 192.168.212.200:22
```

**FTP:**
```bash
iptables -A INPUT -p tcp --dport 22 -s 192.168.212.121 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 22 -d 192.168.212.121 -j ACCEPT
iptables -t nat -A PREROUTING -p tcp --dport 2244 -j DNAT --to-destination 192.168.212.121:22
```
---

### PUNTO 11:
#### El servidor web y el de la Intranet deben estar accesibles desde cualquier equipo del exterior

**SERVIDOR WEB:**
```bash
iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to-destination 192.168.212.100:80
iptables -t nat -A PREROUTING -p tcp --dport 443 -j DNAT --to-destination 192.168.212.100:443
iptables -A FORWARD -p tcp --dport 80 -d 192.168.212.100 -j ACCEPT
iptables -A FORWARD -p tcp --dport 443 -d 192.168.212.100 -j ACCEPT
```

**SERVIDOR INTRANET:**
```bash
iptables -t nat -A PREROUTING -p tcp --dport 20 -j DNAT --to-destination 192.168.212.200:80
iptables -t nat -A PREROUTING -p tcp --dport 21 -j DNAT --to-destination 192.168.212.200:443
iptables -A FORWARD -p tcp --dport 20 -d 192.168.212.200:20 -j ACCEPT
iptables -A FORWARD -p tcp --dport 21 -d 192.168.212.200:21 -j ACCEPT
```
---
### PUNTO 12:
#### El servidor FTP debe estar accesible desde cualquier equipo del exterior:

**SERVIDOR FTP:**
```bash
iptables -t nat -A PREROUTING -p tcp --dport 20 -j DNAT --to-destination 192.168.212.121:20
iptables -t nat -A PREROUTING -p tcp --dport 21 -j DNAT --to-destination 192.168.212.121:21
iptables -A FORWARD -p tcp --dport 20 -d 192.168.212.121:20 -j ACCEPT
iptables -A FORWARD -p tcp --dport 21 -d 192.168.212.121:21 -j ACCEPT
```
---

### PUNTO 13:
#### El servidor web debe poder realizar consultas al servidor que tiene la base de datos.
```bash
iptables -A FORWARD -p tcp --dport 3306 -s 192.168.212.100 -d 192.168.222.200 -j ACCEPT
iptables -A FORWARD -p tcp --sport 3306 -s 192.168.222.200 -d 192.168.212.100 -j ACCEPT
```

---
### PUNTO 14:
#### No podrá consultarse nada más desde la DMZ hacia la LAN.

Como en un principo hemos puesto todas las politicas por defecto en DROP unicamente seran efectivas las reglas que hemos ido indicando antes, asi, ningun tipo de conexion a parte de las indicadas seran posibles de hacer

---

### IMPORTANTE:
Si todas las normas fueran de tipo ACCEPT lo unico que habria que cambiar seria al principio, cuando hemos hecho iptables -F, despues de eso hacer:
```bash
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT
```
