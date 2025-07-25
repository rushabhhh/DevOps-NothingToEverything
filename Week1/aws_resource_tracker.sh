#!/bin/bash

##################
# Author : Rushabh
# Date :  25-July
#
# Version : v1
#
# This script will report AWS Resource usage
###################

OUTPUT_FILE="resourceTracker.txt"

# Clear previous output
echo "AWS Resource Report - $(date)" > $OUTPUT_FILE
echo "------------------------------" >> $OUTPUT_FILE

# AWS S3
echo -e "\n[S3 Buckets]" >> $OUTPUT_FILE
aws s3 ls >> $OUTPUT_FILE

# AWS EC2
echo -e "\n[EC2 Instances]" >> $OUTPUT_FILE
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> $OUTPUT_FILE

# AWS Lambda
echo -e "\n[Lambda Functions]" >> $OUTPUT_FILE
aws lambda list-functions | jq  '.Functions[].FunctionName' >> $OUTPUT_FILE

# AWS IAM Users
echo -e "\n[IAM Users]" >> $OUTPUT_FILE
aws iam list-users >> $OUTPUT_FILE

