az functionapp deployment source config-zip -n ${infra.custom.vars.FUNC_APP} -g ${infra.custom.vars.RES_GROUP} --build-remote false --src /tmp/${service.name}/${artifact.metadata.artifactFileName}
