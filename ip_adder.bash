#!/bin/bash

if [[ $# -eq 2 ]] # IF ARGV LEN WAS EQUAL TO 2, GET IP_FILE AND GATEWAY_IP FROM ARGV
then
    declare IP_FILE="$1"
    declare GATEWAY_IP="$2"
else # OTHERWISE GET THEM FROM STDIN
    echo "Please enter the name of the file containing the IPs:"
    read IP_FILE

    echo "Please enter the gateway IP:"
    read GATEWAY_IP
fi

while IFS= read -r line
do
    ROUTE_CMD="ip route add $line via $GATEWAY_IP"
    echo $ROUTE_CMD
     $ROUTE_CMD
done < "$IP_FILE"
