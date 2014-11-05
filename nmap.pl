#!/usr/bin/perl

$host = $ARGV[0];
$port = $ARGV[1];
$protocol = $ARGV[2];

$nmap = system("sudo proxychains nmap -p $port -s$protocol -Pn $host |grep open |gawk 'BEGIN {count=0} /open/ {count++} END {print count}'");
