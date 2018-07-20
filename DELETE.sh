#!/bin/sh

#Delete Subnets
subnetid=$(python ./files/getallSubnetid.python)
export IFS=","
for id in $subnetid; do
  aws ec2 delete-subnet --subnet-id "$id"
done

#Delete Cutom Route Table
routeid=$(python ./files/getROUTEId.python)
aws ec2 delete-route-table --route-table-id "$routeid"

#Detach Internet Gateway
igwid=$(python ./files/getIGWId.python)
vpcid=$(python ./files/getVPCId.python)
aws ec2 detach-internet-gateway --internet-gateway-id "$igwid" --vpc-id "$vpcid"

#Delete Internet Gateway
aws ec2 delete-internet-gateway --internet-gateway-id "$igwid"

#Delete VPC
aws ec2 delete-vpc --vpc-id "$vpcid"
