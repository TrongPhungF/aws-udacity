aws cloudformation deploy \
   --stack-name cd12352-lesson-changesets \
   --template-file vpc.yml \
   --no-execute-changeset \
    --region us-east-1