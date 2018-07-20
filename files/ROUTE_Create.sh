#!/bin/sh
vpcid=$(python ./files/getVPCId.python)
response=$(aws ec2 create-route-table --vpc-id "$vpcid")
echo "$response" > ./files/ROUTE.json
bash ./files/addroute.sh
