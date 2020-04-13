##########################################
# CLOSE ALERT
##########################################

# Set the OpsGenie Alert API URL
URL="https://api.opsgenie.com/v2/alerts"

# Pass in Alert Alias from Create Alert step to close
curl -X POST "${URL}/${ALIAS}/close?identifierType=alias" -H "Content-Type: application/json" -H "Authorization: GenieKey ${secrets.getValue("ops-genie-token")}" -d '{"user":"Harness", "source":"Harness","note":"Action Executed after successful rollback"}'
