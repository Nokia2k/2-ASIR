FROM ubuntu:20.04

RUN apt update && apt install -y kea-dhcp4-server 
RUN mkdir /var/run/kea 
ADD kea-dhcp4.conf /etc/kea/kea-dhcp4.conf

CMD [ "kea-dhcp4", "-c", "/etc/kea/kea-dhcp4.conf" ]

EXPOSE 67 67/udp
