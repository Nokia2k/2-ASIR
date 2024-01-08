FROM ubuntu:20.04


RUN apt update
RUN apt install dnsmasq --yes
RUN apt install vim --yes

RUN echo "port=53" > /etc/dnsmasq.conf
RUN echo "domain-needed" >> /etc/dnsmasq.conf
RUN echo "bogus-priv" > /etc/dnsmasq.conf
RUN echo "interface=eth0" >> /etc/dnsmasq.conf
RUN echo "bind-interfaces" >> /etc/dnsmasq.conf
RUN echo "expand-hosts" >> /etc/dnsmasq.conf
RUN echo "domain=midnsmasq.com" >> /etc/dnsmasq.conf
RUN echo "listen-address=192.168.34.2" >> /etc/dnsmasq.conf
RUN echo "dhcp-range=192.168.34.10,192.168.34.100,255.255.255.0,12h" >> /etc/dnsmasq.conf
RUN echo "dhcp-option=6,10.239.3.7,8.8.8.8" >> /etc/dnsmasq.conf
RUN echo "dhcp-option=option:router,192.168.34.1" >> /etc/dnsmasq.conf
RUN echo "dhcp-lease-max=86400" >> /etc/dnsmasq.conf
RUN echo "dhcp-leasefile=/var/lib/misc/dnsmasq.leases" >> /etc/dnsmasq.conf
RUN echo "conf-dir=/etc/dnsmasq.d" >> /etc/dnsmasq.conf
RUN echo "address=/servidor.midnsmasq.com/192.168.34.2" >> /etc/dnsmasq.conf
RUN echo "dhcp-authoritative" > /etc/dnsmasq.conf







