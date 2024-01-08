# Reto1
*Victor Martinez Martinez*

---

## Paso 1

**Crearemos una pgaina web para una empresa ficticia que alojaremos en la siguiente ruta:.**
```bash
    mkdir /var/www/empresa
```

## Parte 2

**A continuacion hay que crear el sitio del servidor web en el servicio apache:**

```bash
    cp /etc/apache2/sites-avalible/000-default.conf 
    /etc/apache2/sites-avalible/empresa.conf
```
Dentro de este archivo tendremos que añadir las siguientes lineas:

```bash
  DocumentRoot /var/www/empresa
  ServerName www.empresa-ficticia.com

```

## Parte 3

**Si quisieramos tener dentro de la web de la empresa reservada con cierta seguridad tendriamos que hacer unas modificaciones dentro del archivo**

Primero vamos a crear un subdirectorio dentro del directorio raiz de la pagina de la empresa:

```bash
  cd /var/www/empresa
  mkdir admin
  cd admin
  touch index.html
```
Para añadir reglas de autenticacion primero tenemos que habilitar el modulo **auth_digest**

```bash
  a2enmod auth_digest
  systemctl restart apache2
```

Y despues incluimos la siguiente configuracion en el sitio de la empresa


```bash
  <Directory "/var/www/empresa/admin">
    AuthType Digest
    AuthName "dominio"
    AuthUserFile "/etc/claves/digest.txt"
    Require valid-user
  </Directory>
```

Y añadimos los usuarios 


Para comprbar los puertos que hay abiertos en la maquina donde hemos borrado todas las tablas bastara con usar el comando nmap con los sigiuentes paraemtros:

```bash
    nmap -p 1-1024 192.168.2.22
```
