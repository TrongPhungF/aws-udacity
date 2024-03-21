aws cloudformation create-stack \
   --stack-name stack-server-phung-huynh \
   --template-body file://demoservers.yml \
   --parameters file://demoservers.json \
   --capabilities "CAPABILITY_NAMED_IAM" \
   --region us-east-1