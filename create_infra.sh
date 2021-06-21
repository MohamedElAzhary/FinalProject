#!/usr/bin/env bash

echo "Creating Infrastructure"


if [[ $(aws cloudformation describe-stacks | grep "P5Stack") ]]
then 
 aws cloudformation create-stack --stack-name P5Stack --template-body file://create_stack.yml --region us-west-2 --on-failure DO_NOTHING
fi
 
