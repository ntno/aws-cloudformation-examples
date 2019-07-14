#!/bin/sh

HelloWorldLambdaName=REPLACE_ME_WITH_LAMBDA_NAME
CodeBucketName=REPLACE_ME_WITH_CODE_BUCKET_NAME
CodeS3Key=lambda/helloWorld.zip

zip helloWorld.zip helloWorld.py
aws s3 cp helloWorld.zip s3://${CodeBucketName}/${CodeS3Key} --sse
aws lambda update-function-code --function-name ${HelloWorldLambdaName} --s3-bucket ${CodeBucketName} --s3-key ${CodeS3Key}