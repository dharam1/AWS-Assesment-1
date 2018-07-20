#!/bin/sh
VPC=$(aws ec2 create-vpc --cidr-block 10.0.0.0/16)
echo "$VPC" > ./files/VPC.json
bash ./files/SUBNET-Create.sh
