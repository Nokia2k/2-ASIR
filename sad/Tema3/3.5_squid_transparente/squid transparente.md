# Reto4
*Victor Martinez Martinez*

Squid transparente (Instalacion y configuracion)
---

## Paso 1
**Generaremos la clave privada y la solicitud de firma del certificado:**  
```bash
sudo openssl genrsa -out /etc/ssl/squid/squid.private 2048
sudo openssl req -new -key squid.private -out squid.csr
```
Despues tendremos que firmar la solicitud, para ello:
```bash
sudo openssl x509 -req -days 3652 -in squid.csr -signkey squid.private -out squid.cert

Certificate request self-signature ok
subject=C = ES, ST = Valencia, L = Paiporta, O = Viktor, emailAddress = nikey95024@cubene.com
```

## Paso 2

**A continuacion configuramos el certificado y le indicamos donde almacenar a cache:**
```bash
 sudo /usr/lib/squid/security_file_certgen -c -s /var/lib/ssl_db -M 4MB

Initialization SSL db...
Done
```

Cambiamos los permisos del certificado:
```bash
sudo chown proxy:proxy /var/lib/ssl_db/
```

## Paso 3

**Configuramos el squid.conf con las siguientes lineas:**
```bash
# WELCOME TO SQUID 5.7
# Squid listen Ports
http_port 192.168.99.13:3128 transparent

# SSL Bump Config
https_port 192.168.99.13:3129 intercept ssl-bump generate-host-certificates=on dynamic_cert_mem_cache_size=4MB cert=/etc/ssl/squid/squid.cert key=/etc/ssl/squid/squid.private

# Other configurations
always_direct allow all
ssl_bump server-first all
sslproxy_cert_error allow all
sslproxy_flags DONT_VERIFY_PEER
sslcrtd_program /usr/lib/squid/security_file_certgen -s /var/lib/ssl_db -M 4MB sslcrtd_children 8 startup=1 idle=1
```
Tendremos que darle al servidor y al cliente una ip fija

## Paso 4

**Configuramos las iptables:**
```bash
sudo iptables -A PREROUTING -t nat -i enp0s3 -p tcp --dport 80 -j DNAT --to-destination 192.168.99.13:3128
sudo iptables -A PREROUTING -t nat -i enp0s3 -p tcp --dport 443 -j DNAT --to-destination 192.168.99.13:3129
```
Habilitamos para poder usar el servidor como router:
```bash
 sudo vim /etc/sysctl.conf
 sudo sysctl -p
 net.ipv4.ip_forward = 1
```



