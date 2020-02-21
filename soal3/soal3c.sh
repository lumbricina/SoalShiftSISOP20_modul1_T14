#!/bin/bash

cat wget.log
grep Location: > location.log

mkdir -p duplicate kenangan

awk '{ printf("%s %03d\n", $2, a + 1); a += 1 }' location.log | sort -n -k1 > tmp.log
awk -F ' ' '{ a = $2+0; if ( loc != $1 ){ loc = $1; cmd = " mv pdkt_kusuma_" a " kenangan/kenangan_" a; }
  else{ cmd = "mv pdkt_kusuma_" a " duplicate/duplicate_" a; } system(cmd); }' tmp.log
rm tmp.log

for b in *.log; 
do 
  mv "$b" "${b%.log}.log.bak"
done
