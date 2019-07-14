#!/bin/sh

TemplateName=simple-bucket.yml

BucketName=REPLACE_ME
StackName=${BucketName}-stack

aws cloudformation create-stack --template-body file://${TemplateName} --stack-name ${StackName}  --parameters  ParameterKey=CustomBucketName,ParameterValue=${BucketName} 
