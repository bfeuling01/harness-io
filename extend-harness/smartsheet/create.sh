#### GET SHEET ID #####
ID=$(curl -X GET ${URL} -H "Authorization: Bearer ${TOKEN}" | jq --arg sheet ${SHEET} '.data[] | select(.name == $sheet) | .id')

#####################################################
################### CREATE NEW ROW ##################
#####################################################

#### GET SHEET COLUMNS #####
COL_STATUS=$(curl -X GET "${URL}/${ID}/?level=2&include=objectValue" -H "Authorization: Bearer ${TOKEN}" | jq --arg status ${COL_S} '.columns[] | select(.title == $status) | .id')
COL_TITLE=$(curl -X GET "${URL}/${ID}/?level=2&include=objectValue" -H "Authorization: Bearer ${TOKEN}" | jq --arg title ${COL_T} '.columns[] | select(.title == $title) | .id')
COL_DESC=$(curl -X GET "${URL}/${ID}/?level=2&include=objectValue" -H "Authorization: Bearer ${TOKEN}" | jq --arg desc ${COL_D} '.columns[] | select(.title == $desc) | .id')

##### ADD ROW TO SHEET #####
ROW_ID=$(curl -X POST "${URL}/${ID}/rows" -H "Authorization: Bearer ${TOKEN}" -H "Content-Type: application/json" -d "[{\"toTop\":true,\"cells\": [{\"columnId\": ${COL_STATUS},\"value\": \"${STATUS}\"},{\"columnId\": ${COL_TITLE},\"value\": \"${SUBJECT}\"},{\"columnId\": ${COL_DESC},\"value\": \"${DESCRIPTION}\"}]}]" | jq '.result[0].id')

##### CREATE ROW DISCUSSION #####
DISCUSSION_ID=$(curl -X POST "${URL}/${ID}/rows/${ROW_ID}/discussions" -H "Authorization: Bearer ${TOKEN}" -H "Content-Type: application/json" -d "{\"comment\": {\"text\": \"${MSG}\"}}" | jq '.result.id')

export ${ROW_ID}
export ${DISCUSSION_ID}
