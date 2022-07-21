#!/bin/bash

## create the server

## AMI_ID = "ami-0aa718de62aea6fbe"

AMI_ID=$(aws ec2 describe-images --filters "Name=name,Values=CloudDevOps-LabImage-CentOS7" | jq '.Images[].ImageId' | sed -e 's/"//g')
echo $AMI_ID

aws ec2 run-instances --image-id $AMI_ID --instance-type t2.micro --tags Key=Name,Value=${COMPONENT}