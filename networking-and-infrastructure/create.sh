aws cloudformation create-stack \
   --stack-name stack-phung-huynh \
   --template-body file://ourinfra.yml \
   --parameters file://ourinfra-params.json \
   --region us-east-1