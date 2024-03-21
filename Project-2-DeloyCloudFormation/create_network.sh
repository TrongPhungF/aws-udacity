#!/bin/bash

profile=""

while [ "$#" -gt 0 ]; do
  case "$1" in
    --profile)
      if [ -n "$2" ]; then
        case "$2" in
          -*)
            echo "Error: Argument for $1 is missing" >&2
            exit 1
            ;;
          *)
            profile="$2"
            shift 2
            ;;
        esac
      else
        echo "Error: Argument for $1 is missing" >&2
        exit 1
      fi
      ;;
    *)
      echo "Error: Unsupported flag $1" >&2
      exit 1
      ;;
  esac
done

if [ -n "$profile" ]; then
  aws cloudformation create-stack \
    --stack-name project-2-network \
    --template-body file://network.yml \
    --parameters file://network-parameters.json \
    --capabilities "CAPABILITY_NAMED_IAM" \
    --region us-east-1 \
    --profile "$profile"
else
  aws cloudformation create-stack \
    --stack-name project-2-network \
    --template-body file://network.yml \
    --parameters file://network-parameters.json \
    --capabilities "CAPABILITY_NAMED_IAM" \
    --region us-east-1
fi