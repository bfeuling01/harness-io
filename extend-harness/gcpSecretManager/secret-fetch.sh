export PATH=$PATH:/opt/harness-delegate/google-cloud-sdk/bin

KEY_FILE="/root/gcp_sa.json"

gcloud auth activate-service-account ${secrets.getValue("custom_secret_sa")} --key-file=${KEY_FILE} --project=${PROJECT} > /dev/null 2>&1

gcloud config set disable_file_logging true  > /dev/null 2>&1
gcloud config set disable_prompts true > /dev/null 2>&1
gcloud config set disable_usage_reporting true > /dev/null 2>&1
gcloud config set account ${secrets.getValue("custom_secret_sa")} > /dev/null 2>&1
gcloud config set project ${PROJECT} > /dev/null 2>&1

gcloud services enable --project ${PROJECT} secretmanager.googleapis.com > /dev/null 2>&1

ACCESS_TOKEN=$(gcloud auth print-access-token)

PROJECT_NUMBER=$(gcloud projects describe ${PROJECT} | grep projectNumber | cut -d':' -f2 | tr -d "'")

# Get the secret
export secret=$(curl "https://secretmanager.googleapis.com/v1/projects/${PROJECT_NUMBER}/secrets/${SECRET_NAME}/versions/latest:access?key=${secrets.getValue("gcp_api_key")}" -H "Authorization: Bearer ${ACCESS_TOKEN}" -H 'Accept: application/json' | jq '.payload.data' | tr -d '"' | base64 -d)
