#!/bin/bash
aws cloudformation deploy \
--region us-east-1 \
--parameter-overrides DynamoName="transactions" DynamoKey="id" \
--stack-name dynamodb-transactions \
--template-file ./dynamodb.yml