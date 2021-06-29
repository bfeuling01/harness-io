SLUG=$(curl -X GET --header 'Accept: application/json' --header "X-VO-Api-Id: ${secrets.getValue("victorops-api-id")}" --header "X-VO-Api-Key: ${secrets.getValue("victorops-api-token")}" "https://api.victorops.com/api-public/v1/policies?filter=${POLICY_NAME}" | jq '.policies[].policy.slug')

export NUM=$(curl -L -X POST "https://api.victorops.com/api-public/v1/incidents" -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'X-VO-Api-Id: ${secrets.getValue("victorops-api-id")}' -H 'X-VO-Api-Key: ${secrets.getValue("victorops-api-token")}' -d '{
    "summary": "'${SUMMARY}'",
    "details": "'${DETAILS}'",
    "userName": "'${USERNAME}'",
    "targets": [
        {
            "type": "EscalationPolicy",
            "slug": '"${SLUG}"'
        },
        {
            "type": "User",
            "slug": "'${SLUG_USER}'"
        }
    ],
    "isMultiResponder": false
}' | jq '.incidentNumber')
