echo ${Azure_PAT} | az devops login --organization ${azureOrg}

az boards work-item create --title "${wiTitle}" --type ${wiType} --area "${wiArea}" --assigned-to ${wiAssignedTo} --description "${wiDescription}" --discussion "${wiDiscuss}" --project ${wiProject} --query id
