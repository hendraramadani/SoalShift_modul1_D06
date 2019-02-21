#!/bin/bash
unzip ~/modul1/bahan/nature.zip -d ~/modul1

j="0"
for i in ~/modul1/nature/*.jpg
do 
base64 -d $i | xxd -r >> ~/modul1/hasil/$j.jpg
j=$(($j+1))
done

rm -rf ~/modul1/nature
