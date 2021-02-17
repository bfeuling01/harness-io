export AWS_ACCESS_KEY_ID=${secrets.getValue("<insert secret>")}
export AWS_SECRET_ACCESS_KEY=${secrets.getValue("<insert secret>")}

mkdir -p /tmp/${service.name}/${service.name}/

aws s3 cp s3://${artifact.metadata.bucketName}/${artifact.metadata.artifactPath} /tmp/${service.name}
