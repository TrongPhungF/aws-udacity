aws cloudformation create-stack \
   --stack-name stack-storage-phung-huynh \
   --template-body file://rds-example.yml \
   --parameters file://rds-params.json \
   --region us-east-1