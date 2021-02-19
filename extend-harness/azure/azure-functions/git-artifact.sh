az functionapp deployment source config -n ${infra.custom.vars.FUNC_APP} -g ${infra.custom.vars.RES_GROUP} -u ${GIT_URL} --branch ${BRANCH} --manual-integration
