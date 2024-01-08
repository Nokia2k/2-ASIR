;
; BIND data file for local loopback interface
;

$TTL    1d ; default expiration time (in seconds) of all RRs without their own TTL value
@       IN      SOA     victor.com. root.victor.com. (
                  3      ; Serial
                  1d     ; Refresh
                  1h     ; Retry
                  1w     ; Expire
                  1h )   ; Negative Cache TTL

; name servers - NS records
@    IN      NS      victor.com.

; name servers - A records
ns1.victor.com.            IN      A      56.23.45.2
ns2.victor.com.            IN      A      56.23.45.10
www.victor.com.        IN      A      56.23.45.3 
ftp.victor.com.        IN      A      56.23.45.3

$ORIGIN valencia.victor.com.

@   IN  NS  subd
sudb	IN	A	56.23.45.5

$ORIGIN caceres.victor.com.

@	IN	NS	subd2
subd2	IN	A	56.23.45.6
