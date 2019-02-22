#!/bin/bash

kecil=abcdefghijklmnopqrstuvwxyz
besar=ABCDEFGHIJKLMNOPQRSTUVWXYZ
tanggal=`date '+%H:%M %d-%m-%Y'`
x=`date '+%H'`
tr "$besar$kecil" "${besar:x}${besar:0:x}${kecil:x}${kecil:0:x}" <<< `cat /var/log/syslog` > ~/"$tanggal"
