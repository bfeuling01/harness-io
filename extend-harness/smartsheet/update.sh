#### GET SHEET ID #####
ID=$(curl -X GET ${URL} -H "Authorization: Bearer ${TOKEN}" | jq --arg sheet ${SHEET} '.data[] | select(.name == $sheet) | .id')

#####################################################
##################### UPDATE ROW ####################
#####################################################

##### UPDATE STATUS #####
COL_STATUS=$(curl -X GET "${URL}/${ID}/?level=2&include=objectValue" -H "Authorization: Bearer ${TOKEN}" | jq --arg status ${COL_S} '.columns[] | select(.title == $status) | .id')
curl -X PUT "${URL}/${ID}/rows" -H "Authorization: Bearer ${TOKEN}" -H "Content-Type: application/json" -d "[{\"id\": \"${ROW_ID}\",\"cells\": [{\"columnId\": ${COL_STATUS},\"value\": \"${STATUS}\"}]}]"

##### ADD ROW DISCUSSION #####
curl -X POST "${URL}/${ID}/discussions/${DISCUSSION_ID}/comments" -H "Authorization: Bearer ${TOKEN}" -H "Content-Type: application/json" -d "{\"text\": \"${MSG}\"}"
