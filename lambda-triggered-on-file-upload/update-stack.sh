#!/bin/sh

LambdaName=REPLACE_ME_WITH_NAME_FOR_LAMBDA_FUNCTION
FileBucketName=REPLACE_ME_WITH_NAME_FOR_FILE_BUCKET
CodeBucketName=REPLACE_ME_WITH_CODE_BUCKET_NAME
CodeS3Key=lambda/processFile.zip

TemplateName=file-processing-lambda.yml
StackName=${LambdaName}-stack


#copy template to s3
aws s3 cp ${TemplateName} s3://${CodeBucketName}/cft/${TemplateName} --sse

#create the stack
aws cloudformation update-stack \
                    --template-url https://${CodeBucketName}.s3.amazonaws.com/cft/${TemplateName} \
                    --stack-name ${StackName}  \
                    --parameters  ParameterKey=CodeBucketName,ParameterValue=${CodeBucketName}  \
                                  ParameterKey=CodeS3Key,ParameterValue=${CodeS3Key} \
                                  ParameterKey=LambdaName,ParameterValue=${LambdaName} \
                                  ParameterKey=FileBucketName,ParameterValue=${FileBucketName} \
                     --capabilities CAPABILITY_NAMED_IAM
