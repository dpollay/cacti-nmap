#!/usr/bin/perl

$host = $ARGV[0];
$port = $ARGV[1];
$protocol = $ARGV[2];

open(PROCESS, "sudo nmap -p $port -s$protocol -Pn $host |grep open |gawk 'BEGIN {count=0} /open/ {count++} END {print count}' |");
$query = <PROCESS>;
close(PROCESS);
$nmapQuery = $query;

open(PROCESS, "sudo nmap -p $port -s$protocol -Pn $host | grep latency |");
$nmap = <PROCESS>;
close(PROCESS);
$nmap =~ m/ .*is .*[up|down] (.*) /g;
$nmap3 = substr($1, 1);
$nmap4 = chop($nmap3);
$output = $nmapQuery;
$output += ",";
$output += $nmap3;
if ($nmap3 == ""){
	$nmap3 = '0'
}
if ($nmapQuery == ""){
	$nmapQuery = '0';
}
print "latency:" . $nmap3 . " port_status:" . $nmapQuery;

