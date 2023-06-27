#!/bin/bash

echo "Please enter the name of the file containing the IPs:"
read IP_FILE

echo "Please enter the gateway IP:"
read GATEWAY_IP

while IFS= read -r line
do
    ROUTE_CMD="ip route add $line via $GATEWAY_IP"
    echo $ROUTE_CMD
     $ROUTE_CMD
done < "$IP_FILE"
