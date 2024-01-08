FROM ubuntu:20.04

RUN apt update
RUN apt install -y dnsutils
RUN apt install -y bind9
RUN apt install -y bind9utils
RUN apt purge --auto-remove && apt clean

ADD named.conf.local /etc/bind/
ADD named.conf.options /etc/bind/
ADD db.victor.com /etc/bind/

EXPOSE 53/tcp
EXPOSE 53/udp
EXPOSE 953/tcp

CMD ["/usr/sbin/named","-g","-c","/etc/bind/named.conf","-u","bind"]
