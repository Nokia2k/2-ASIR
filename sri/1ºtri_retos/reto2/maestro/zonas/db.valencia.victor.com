;
; BIND data file for local loopback interface
;

$TTL    86400
@       IN      SOA     subd.valencia.victor.com. mail.valencia.victor.com. (
                              4         
                         604800    
                          86400     
                        2419200   
                          86400 )   
$ORIGIN valencia.victor.com.
@       IN      NS      subd
subd     IN      A       56.23.45.5
www     IN      A       56.23.45.3
ftp     IN      A       56.23.45.3
