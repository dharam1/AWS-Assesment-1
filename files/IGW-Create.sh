#!/bin/sh
vpcid=$(python ./files/getVPCId.python)
response=$(aws ec2 create-internet-gateway)
echo "$response" > ./files/IGW.json
IGWID=$(python ./files/getIGWId.python)
aws ec2 attach-internet-gateway --internet-gateway-id "$IGWID" --vpc-id "$vpcid"
bash ./files/ROUTE_Create.sh

