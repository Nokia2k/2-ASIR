;
; BIND data file for local loopback interface
;

$TTL    86400
@       IN      SOA     subd2.caceres.victor.com. mail.caceres.victor.com. (
                              4         
                         604800    
                          86400     
                        2419200   
                          86400 )   
$ORIGIN caceres.victor.com.
@       IN      NS      subd2
subd2    IN      A       56.23.45.6
www     IN      A       56.23.45.3
ftp     IN      A       73.56.12.2
