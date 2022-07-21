#!/bin/bash

## create the server

## AMI_ID = "ami-0aa718de62aea6fbe"
COMPONENT=$1
SGID=sg-07448acb825353d77
AMI_ID=$(aws ec2 describe-images --filters "Name=name,Values=CloudDevOps-LabImage-CentOS7" | jq '.Images[].ImageId' | sed -e 's/"//g')
echo $AMI_ID
echo "creating $COMPONENT server"
aws ec2 run-instances --security-group-ids $SGID --image-id $AMI_ID --instance-type t2.micro --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${COMPONENT}}]" | jq