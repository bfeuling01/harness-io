# SET STORY TO COMPLETED

COMPLETED=`curl -X GET -H "Content-Type: application/json" -L "${API_URL}/workflows?token=${SECRET}" | jq -r '.[].states[] | select(.name=="Completed") | .id'`

#### ADDING COMMENT

curl -X POST -L "https://api.clubhouse.io/api/v3/stories/${STORY_ID}/comments?token=${SECRET}" -H "Content-Type: application/json" -d "{\"text\": \"Approved and Completed\"}"

#### UPDATING STATE

curl -X PUT -L "${API_URL}/stories/${STORY_ID}?token=${SECRET}" -H "Content-Type: application/json" -d "{\"workflow_state_id\": \"${COMPLETED}\"}}"
