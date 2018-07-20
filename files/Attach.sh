#!/bin/sh
routeid=$(python ./files/getROUTEId.python)
subnetid=$(python ./files/getSubnetId.python)

#echo "${subnetid}"

IFS=, read a b c <<< "$subnetid"

#echo "$a"

response=$(aws ec2 associate-route-table --route-table-id "$routeid" --subnet-id "$a")
echo "$response" > ./files/public_0_Association

response=$(aws ec2 associate-route-table --route-table-id "$routeid" --subnet-id "$b")
echo "$response" > ./files/public_1_Association

response=$(aws ec2 associate-route-table --route-table-id "$routeid" --subnet-id "$c")
echo "$response" > ./files/public_2_Association

bash ./files/addtags.sh

