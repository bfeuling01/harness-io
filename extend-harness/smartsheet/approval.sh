echo "### BEARER TOKEN #####"
TOKEN=${secrets.getValue("smar_token")}

echo "### SMARTSHEET URL###"
URL="https://api.smartsheet.com/2.0/sheets"

echo "#### GET SHEET ID #####"
ID=`curl -X GET ${URL} -H "Authorization: Bearer ${TOKEN}" | jq --arg sheet ${workflow.variables.sheet_name} '.data[] | select(.name == $sheet) | .id'`

echo "#### GET CURRENT STATUS #####"
CUR_STATUS=`curl -X GET "${URL}/${ID}/rows/${content.smar.ROW_ID}" -H "Authorization: Bearer ${TOKEN}" -H "Content-Type: application/json" | jq '.cells[0].value'`
curl -X GET "${URL}/${ID}/rows/${context.smar.ROW_ID}" -H "Authorization: Bearer ${TOKEN}" -H "Content-Type: application/json" | jq '.cells[0].value'
DES_STATUS='"Approved"'

echo "#### STATUS TEST #####"
while [[ ${CUR_STATUS} != ${DES_STATUS} ]]; do
  echo "Change status to Approved"
  CUR_STATUS=`curl -X GET "${URL}/${ID}/rows/${context.smar.ROW_ID}" -H "Authorization: Bearer ${TOKEN}" -H "Content-Type: application/json" | jq '.cells[0].value'`
  echo ${CUR_STATUS}
  echo ${DES_STATUS}
  sleep 5
done

export HARNESS_APPROVAL_STATUS="APPROVED"
