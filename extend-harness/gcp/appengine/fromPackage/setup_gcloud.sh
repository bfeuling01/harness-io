export PATH=$PATH:/opt/harness-delegate/google-cloud-sdk/bin

KEY_FILE="/root/gae_sa.json"

gcloud auth activate-service-account ${serviceAccount} --key-file=${KEY_FILE} --project=${projectID} > /dev/null 2>&1

gcloud config set disable_file_logging true  > /dev/null 2>&1
gcloud config set disable_prompts true > /dev/null 2>&1
gcloud config set disable_usage_reporting true > /dev/null 2>&1
gcloud config set account ${serviceAccount} > /dev/null 2>&1
gcloud config set project ${projectID} > /dev/null 2>&1

gcloud services enable --project ${projectID} appengineflex.googleapis.com > /dev/null 2>&1

gcloud services enable --project ${projectID} appengine.googleapis.com > /dev/null 2>&1
