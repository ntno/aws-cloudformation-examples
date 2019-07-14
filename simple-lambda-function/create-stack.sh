#!/bin/sh

HelloWorldLambdaName=REPLACE_ME_WITH_LAMBDA_NAME
CodeBucketName=REPLACE_ME_WITH_CODE_BUCKET_NAME
CodeS3Key=lambda/helloWorld.zip

TemplateName=simple-lambda.yml
StackName=${HelloWorldLambdaName}-stack

#zip the lambda code and upload to S3
zip helloWorld.zip helloWorld.py
aws s3 cp helloWorld.zip s3://${CodeBucketName}/${CodeS3Key} --sse

#create the stack
aws cloudformation create-stack \
                    --template-body file://${TemplateName} \
                    --stack-name ${StackName}  \
                    --parameters  ParameterKey=CodeBucketName,ParameterValue=${CodeBucketName}  \
                                  ParameterKey=CodeS3Key,ParameterValue=${CodeS3Key} \
                                  ParameterKey=HelloWorldLambdaName,ParameterValue=${HelloWorldLambdaName} \
                     --capabilities CAPABILITY_NAMED_IAM

