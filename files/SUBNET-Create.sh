#!/bin/sh
vpcid=$(python ./files/getVPCId.python)

response=$(aws ec2 create-subnet --vpc-id "$vpcid" --cidr-block 10.0.0.0/22 --availability-zone us-east-2a)
echo "$response" > ./files/public-2a


response=$(aws ec2 create-subnet --vpc-id "$vpcid" --cidr-block 10.0.4.0/22 --availability-zone us-east-2a)
echo "$response" > ./files/private-2a

response=$(aws ec2 create-subnet --vpc-id "$vpcid" --cidr-block 10.0.8.0/22 --availability-zone us-east-2b)
echo "$response" > ./files/public-2b

response=$(aws ec2 create-subnet --vpc-id "$vpcid" --cidr-block 10.0.16.0/22 --availability-zone us-east-2b)
echo "$response" > ./files/private-2b

response=$(aws ec2 create-subnet --vpc-id "$vpcid" --cidr-block 10.0.32.0/22 --availability-zone us-east-2c)
echo "$response" > ./files/public-2c

response=$(aws ec2 create-subnet --vpc-id "$vpcid" --cidr-block 10.0.64.0/22 --availability-zone us-east-2c)
echo "$response" > ./files/private-2c

bash ./files/IGW-Create.sh

