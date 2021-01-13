ACCESS_TOKEN=$(gcloud auth print-access-token)

curl -X GET -H "Authorization: Bearer ${ACCESS_TOKEN}" -o "${ARTIFACT_FILE_NAME}" "https://storage.googleapis.com/storage/v1/b/${artifact.bucketName}/o/${ARTIFACT_FILE_NAME}?alt=media"

tar -xvf ${ARTIFACT_FILE_NAME}

gcloud app deploy ./${service.name}/app.yaml

rm -r ./${service.name}
rm -r ./${ARTIFACT_FILE_NAME}
