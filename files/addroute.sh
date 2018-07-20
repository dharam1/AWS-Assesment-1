#!/bin/sh
routerid=$(python ./files/getROUTEId.python)
igwid=$(python ./files/getIGWId.python)


response=$(aws ec2 create-route --route-table-id "$routerid" --destination-cidr-block 0.0.0.0/0 --gateway-id "$igwid")
bash ./files/Attach.sh
