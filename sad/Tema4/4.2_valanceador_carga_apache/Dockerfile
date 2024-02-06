# Utilizamos la imagen base de Ubuntu 20.04
FROM ubuntu:22.04

# Actualizamos el sistema e instalamos Apache
RUN apt-get update && \
    apt-get install -y apache2

# Habilitamos los módulos de balanceo de carga
RUN a2enmod proxy && \
    a2enmod proxy_http && \
    a2enmod proxy_balancer && \
    a2enmod lbmethod_byrequests

# Copiamos la configuración de Apache para el balanceo de carga
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

# Exponemos el puerto 80 para acceder a Apache
EXPOSE 80

# Iniciamos Apache en primer plano al iniciar el contenedor
CMD ["apachectl", "-D", "FOREGROUND"]

