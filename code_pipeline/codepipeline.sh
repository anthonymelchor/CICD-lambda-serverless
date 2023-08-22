#!/bin/bash
aws cloudformation deploy \
--region us-east-1 \
--stack-name codepipeline-transactions \
--template-file ./codepipeline.yml \
--capabilities CAPABILITY_IAM \
--capabilities CAPABILITY_NAMED_IAM