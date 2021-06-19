#!/usr/bin/env bash

echo "Creating Infrastructure"

aws cloudformation create-stack --stack-name P5-Stack --template-body file://create_stack.yml --region us-west-2 --on-failure DO_NOTHING
