FROM ubuntu:20.04

RUN apt update
RUN apt install -y dnsutils
RUN apt install -y bind9
RUN apt install -y bind9utils
RUN apt purge --auto-remove && apt clean
RUN mkdir /etc/bind/zonas

COPY dns-config/bind/named.conf.local /etc/bind/
COPY dns-config/bind/named.conf.options /etc/bind/
COPY dns-config/bind/zonas/db.victor.com /etc/bind/zonas/
COPY dns-config/bind/zonas/db.valencia.victor.com /etc/bind/zonas/
COPY dns-config/bind/zonas/db.caceres.victor.com /etc/bind/zonas/

EXPOSE 53/tcp
EXPOSE 53/udp
EXPOSE 953/tcp

CMD ["/usr/sbin/named","-g", "-c", "/etc/bind/named.conf", "-u", "bind"]
