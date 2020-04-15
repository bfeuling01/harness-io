# UPDATE CLUBHOUSE STORY

IN_DEV_ID=`curl -X GET -H "Content-Type: application/json" -L "${API_URL}/workflows?token=${SECRET}" | jq -r '.[].states[] | select(.name=="In Development") | .id'`

#### ADDING COMMENT

curl -X POST -L "https://api.clubhouse.io/api/v3/stories/${STORY_ID}/comments?token=${SECRET}" -H "Content-Type: application/json" -d "{\"text\": \"Deployment of ${service.name} to ${env.name} successful\"}"

#### UPDATING STATE

curl -X PUT -L "${API_URL}/stories/${STORY_ID}?token=${SECRET}" -H "Content-Type: application/json" -d "{\"workflow_state_id\": \"${IN_DEV_ID}\"}"
