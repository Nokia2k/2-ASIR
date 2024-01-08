;
; BIND data file for local loopback interface
;

$TTL 86400
@ IN SOA ns1.victor.com. admin.victor.com. (
            2023110501 ; Serial
            3600       ; Refresh
            1800       ; Retry
            604800     ; Expire
            86400 )    ; Negative Cache TTL


    IN  NS  ns1.victor.com.
ns1.victor.com. IN A 192.168.10.2
www no esta pero podria estar 192.168.10.3 
ftp no esta pero podria estar 192.168.10.3

$ORIGIN valencia.victor.com.

@	IN	NS	vlc.valencia.victor.com.
vlc IN    A   56.23.45.5

$ORIGIN cac.victor.com.

@	IN  NS	cac.caceres.victor.com.
cac IN    A   56.23.45.6



