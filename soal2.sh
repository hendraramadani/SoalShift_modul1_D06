#!/bin/bash

echo "a."; awk -F ',' '{if($7=='2012') y[$1]+=$10} END {for(i in y) {print y[i]" "i}}' ~/modul1/bahan/WA_Sales_Products_2012-14.csv | sort -nr | head -1
echo "b."; awk -F, '{if($1=="United States" && $7=="2012") y[$4]+=$10;} END {for(i in y) print y[i]","i}' ~/modul1/bahan/WA_Sales_Products_2012-14.csv | sort -n -r | head -n 3 | awk -F, '{print $2}'
echo "c."; awk -F, '{if($1=="United States" && $7=="2012" && ($4=="Personal Accessories" || $4=="Camping Equipment" || $4=="Outdoor Protection")) y[$6]+=$10;} END {for(i in y) print y[i]","i}' ~/modul1/bahan/WA_Sales_Products_2012-14.csv | sort -n -r | head -n 3 | awk -F, '{print $2}'
