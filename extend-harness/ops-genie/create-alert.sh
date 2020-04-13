##########################################
# CREATE ALERT
##########################################

# Install JQ
apt-get -y install jq

# Set OpsGenie Alert API URL
URL="https://api.opsgenie.com/v2/alerts"

# Create the Alert and get the RequestID
REQ=$(curl -X POST "${URL}" -H "Content-Type: application/json" -H "Authorization: GenieKey ${secrets.getValue("ops-genie-token")}" -d "{\"message\": \"${MSG}\"}" | jq -r '.requestId')

# Pass the Alert RequestID from the previous step to get Alias for Closing Alert
export ALIAS=$(curl -X GET "${URL}/requests/${REQ}" -H "Authorization: GenieKey ${secrets.getValue("ops-genie-token")}" | jq -r '.data.alias')
