#!/bin/sh
IGWID=$(python ./files/getIGWId.python)
aws ec2 create-tags \
  --resources $IGWID \
  --tags "Key=Name,Value=Dharam-IGW" \
  --region us-east-2

routerid=$(python ./files/getROUTEId.python)
aws ec2 create-tags \
  --resources $routerid \
  --tags "Key=Name,Value=Dharam-Router" \
  --region us-east-2

subnetid=$(python ./files/getallSubnetid.python)
export IFS=","
for id in $subnetid; do
  aws ec2 create-tags \
  --resources "$id" \
  --tags "Key=Name,Value=Dharam-$id" \
  --region us-east-2
done

vpcid=$(python ./files/getVPCId.python)
aws ec2 create-tags \
  --resources "$vpcid" \
  --tags "Key=Name,Value=Dharam-VPC" \
  --region us-east-2

