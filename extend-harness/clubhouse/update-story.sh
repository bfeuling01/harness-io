# UPDATE CLUBHOUSE STORY

IN_DEV_ID=`curl -X GET -H "Content-Type: application/json" -L "${API_URL}/workflows?token=${secrets.getValue("clubhouse-token")}" | jq -r '.[].states[] | select(.name=="In Development") | .id'`

#### ADDING COMMENT

curl -X POST -L "https://api.clubhouse.io/api/v3/stories/${STORY_ID}/comments?token=${secrets.getValue("clubhouse-token")}" -H "Content-Type: application/json" -d "{\"text\": \"Deployment of ${service.name} to ${env.name} successful\"}"

#### UPDATING STATE

curl -X PUT -L "${API_URL}/stories/${STORY_ID}?token=${secrets.getValue("clubhouse-token")}" -H "Content-Type: application/json" -d "{\"workflow_state_id\": \"${IN_DEV_ID}\"}"
