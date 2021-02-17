export AWS_ACCESS_KEY_ID=${secrets.getValue("<insert secret>")}
export AWS_SECRET_ACCESS_KEY=${secrets.getValue("<insert secret>")}

aws cloudfront list-distributions --query 'DistributionList.Items' | jq -r --arg SVC "${service.name}" 'select(.[].Origins.Items[].DomainName | startswith($SVC))' > $INSTANCE_OUTPUT_PATH
