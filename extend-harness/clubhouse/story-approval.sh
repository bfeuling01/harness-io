# INSTALL JQ
apt-get install -y jq

# CHECK AND COMPARE STORY STATE
CURRENT_STATE=`curl -X GET -L "${API_URL}/stories/${STORY.STORY_ID}?token=${SECRET}" -H "Content-Type: application/json" | jq '.workflow_state_id'`
DESIRED_STATE=`curl -X GET -H "Content-Type: application/json" -L "${API_URL}/workflows?token=${SECRET}" | jq -r '.[].states[] | select(.name=="Ready for Deploy") | .id'`

while [ "${CURRENT_STATE}" != "${DESIRED_STATE}" ]; do
  CURRENT_STATE=`curl -X GET -L "${API_URL}/stories/${STORY.STORY_ID}?token=${SECRET}" -H "Content-Type: application/json" | jq '.workflow_state_id'`
  echo ${CURRENT_STATE}
  sleep 15
done

export HARNESS_APPROVAL_STATUS="APPROVED"
