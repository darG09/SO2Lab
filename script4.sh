#!/bin/bash

#> plikk
#grep sroda | sed 's/sroda/piatek' | sort
#sed -i 's/Doktor/Profesor' ludzie.csv
clear
./fakaping.sh 2> >(sort) >/dev/null
echo -e "\n"
./fakaping.sh > templog 2>&1
sort templog | uniq > all.log
cat all.log

for file in groovies/*; do
    sed -i '/Help docs:/d' "$file"
    sed -i 's/\$HEADER\$/\/temat\//g' "$file"
done
echo -e "\n"
grep "DELETE" access_log | sort | uniq