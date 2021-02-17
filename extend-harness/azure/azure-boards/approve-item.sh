export AZURE_DEVOPS_EXT_PAT=${secrets.getValue("azure-pat")}
az devops configure --defaults organization=https://dev.azure.com/<your org>

CURRENT_STATE=`az boards work-item show --id ${AZ.AZURE_WI_ID} --query 'fields."System.State"'`
DESIRED_STATE='"Done"'

while [[ ${CURRENT_STATE} != ${DESIRED_STATE} ]]; do
  echo "Move to Done"
  CURRENT_STATE=`az boards work-item show --id ${AZ.AZURE_WI_ID} --query 'fields."System.State"'`
  echo "Current State: ${CURRENT_STATE}"
  sleep 5
done

export HARNESS_APPROVAL_STATUS="APPROVED"
