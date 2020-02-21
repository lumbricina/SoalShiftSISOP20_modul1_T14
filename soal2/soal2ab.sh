#!/bin/bash 

if [[ $1 =~ ^[a-zA-Z]+$ ]] 
then
	dd if=/dev/urandom|tr -cd A-Za-z0-9|head -c 28 >> $1.txt
else
	echo "error"
fi
done
