#!/bin/sh

LambdaName=REPLACE_ME_WITH_NAME_FOR_LAMBDA_FUNCTION
FileBucketName=REPLACE_ME_WITH_NAME_FOR_FILE_BUCKET
CodeBucketName=REPLACE_ME_WITH_CODE_BUCKET_NAME
CodeS3Key=lambda/processFile.zip


#copy the code to S3
zip processFile.zip processFile.py
aws s3 cp processFile.zip s3://${CodeBucketName}/${CodeS3Key} --sse

#update lambda function
aws lambda update-function-code --function-name ${LambdaName} --s3-bucket ${CodeBucketName} --s3-key ${CodeS3Key}
