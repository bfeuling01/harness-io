echo ${Azure_PAT} | az devops login --organization ${azureOrg}

CURRENT_STATE=`az boards work-item show --id ${wiID} --query 'fields."System.State"'`
DESIRED_STATE='"Done"'

while [[ ${CURRENT_STATE} != ${DESIRED_STATE} ]]; do
  echo "Move to Done"
  CURRENT_STATE=`az boards work-item show --id ${wiID} --query 'fields."System.State"'`
  echo "Current State: ${CURRENT_STATE}"
  sleep 5
done
