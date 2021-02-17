export AWS_ACCESS_KEY_ID=${secrets.getValue("<insert secret>")}
export AWS_SECRET_ACCESS_KEY=${secrets.getValue("<insert secret>")}

unzip /tmp/${service.name}/${artifact.metadata.artifactFileName} -d /tmp/${service.name}/${service.name}

aws s3 cp /tmp/${service.name}/${service.name} s3://${serviceVariable.destination} --recursive

rm -rf /tmp/${service.name}
