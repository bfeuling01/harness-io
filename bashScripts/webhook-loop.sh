#!/usr/bin/env bash

################################################
#
#    CREATED BY: Bryan Feuling
#    PURPOSE: Demo Conditional API calls
#
################################################

WHURL=<WebHook URL>
APPID=<App ID>

nginx=("${ENV}" "${SVC}" "${INFRA}")
nodejs=("${ENV}" "${SVC}" "${INFRA}")
alpine=("${ENV}" "${SVC}" "${INFRA}")
docker=("${ENV}" "${SVC}" "${INFRA}")

echo "Which Services would you like to deploy? "
echo "acs"
echo "swsim"
echo "bridge"
echo "db patch"
echo " "
read -a arr

APICALL() {
     curl -X POST -H 'content-type: application/json' --url "${1}" -d '{"application":"'${2}'","parameters":{"Environment":"'${3}'","Service":"'${4}'","ServiceInfra_Kubernetes":"'${5}'"},"artifacts":[{"service":"'${4}'","buildNumber":"'${6}'"}]}'
}

for i in "${arr[@]}"
do
     case "${i}" in
          "nginx")
               echo -e "\n\nNGINX Build/Version Number:"
               read nginxBN
               APICALL "${WHURL}" "${APPID}" "${nginx[0]}" "${nginx[1]}" "${nginx[2]}" "${nginxBN}"
               sleep 1
               ;;
          "nodejs")
               echo -e "\n\nNodeJS Build/Version Number:"
               read nodeBN
               APICALL "${WHURL}" "${APPID}" "${nodejs[0]}" "${nodejs[1]}" "${nodejs[2]}" "${nodeBN}"
               sleep 1
               ;;
          "alpine")
               echo -e "\n\nAlpine Build/Version Number:"
               read alpineBN
               APICALL "${WHURL}" "${APPID}" "${alpine[0]}" "${alpine[1]}" "${alpine[2]}" "${alpineBN}"
               sleep 1
               ;;
          "docker")
               echo -e "\n\nDocker Build/Version Number:"
               read dockerBN
               APICALL "${WHURL}" "${APPID}" "${docker[0]}" "${docker[1]}" "${docker[2]}" "${dockerBN}"
               sleep 1
               ;;
          *) echo -e "${i} is invalid";;
     esac
done
