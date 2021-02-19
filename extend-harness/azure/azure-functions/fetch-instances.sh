RESP="[$(az functionapp function show --function-name ${service.name} -n ${FUNC_APP} -g ${RES_GROUP})]"

echo "${RESP}" | jq '.' > $INSTANCE_OUTPUT_PATH
