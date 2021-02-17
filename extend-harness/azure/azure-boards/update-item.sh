echo ${Azure_PAT} | az devops login --organization ${azureOrg}

az boards work-item update --id ${wiID} --discussion "${wiDiscuss}" --state ${wiState}