git clone ${gitRepo} ${service.name}

gcloud app deploy ./${service.name}/app.yaml

rm -r ./${service.name}
