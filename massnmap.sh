#!/bin/sh

usage="massnmap.sh <ips-file> <basedirectory> [custom-nmap-flags]"

if [ $# -lt 2 ] || [ $1 = "--help" ] || [ $1 = "-h" ]
then 
	echo $usage
	exit
fi

ips=`cat $1`
basedir=$2
nmap_flags=${3:-"-sC -p- -vv --reason  -sV -Pn -sS -O"}
for ip in $ips;
do 
	echo "$ip $basedir"
	mkdir "$basedir/$ip"
	mkdir "$basedir/$ip/enum"
	mkdir "$basedir/$ip/enum/nmap"
	mkdir "$basedir/$ip/exploitation"
	mkdir "$basedir/$ip/privesc"
	mkdir "$basedir/$ip/post"
	nmap $nmap_flags -oN $basedir/$ip/enum/nmap/scan1 $ip
done
