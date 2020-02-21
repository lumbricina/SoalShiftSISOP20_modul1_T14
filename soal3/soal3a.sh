#!/bin/bash
nama="wget"
nama=$nama".log"
nama=${nama// /_}
pnama="pdkt_kusuma_"
echo $nama
for a in {1..28}
do
 wget -a ${nama} -O ${pnama}$a "https://loremflickr.com/320/240/cat"
done
