echo ${secrets.getValue("azure-pat")} | az devops login --organization <azure org>

CURRENT_STATE=`az boards work-item show --id ${AZ.AZURE_WI_ID} --query 'fields."System.State"'`
DESIRED_STATE='"Done"'

while [[ ${CURRENT_STATE} != ${DESIRED_STATE} ]]; do
  echo "Move to Done"
  CURRENT_STATE=`az boards work-item show --id ${AZ.AZURE_WI_ID} --query 'fields."System.State"'`
  echo "Current State: ${CURRENT_STATE}"
  sleep 5
done
