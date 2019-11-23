####### Dockerfile for Harness Delegate #######
#### Get Latest Delegate ####
FROM harness/delegate:latest
#### Set Required Environment Variables ####
### Download a Delegate from your Harness account to get the required information below ###
# Hostname must be unique #
ENV HOSTNAME <unique name>
ENV ACCOUNT_ID <account id>
ENV ACCOUNT_SECRET <account secret>
ENV MANAGER_HOST_AND_PORT <harness manager host>
ENV WATCHER_STORAGE_URL <harness storage url>
ENV WATCHER_CHECK_LOCATION <harness check location>
ENV DELEGATE_STORAGE_URL <delegate storage url>
ENV DELEGATE_CHECK_LOCATION <delegate check location>
ENV DEPLOY_MODE KUBERNETES
ENV POLL_FOR_TASKS false
# ENV PROXY_HOST
# ENV PROXY_PORT
# ENV PROXY_SCHEME
# ENV PROXY_USER
# ENV PROXY_PASSWORD
# ENV NO_PROXY
# ENV HELM_DESIRED_VERSION
#### Add any required binaries here ######
## GIT CLI ##
# RUN apt-get update yes | apt-get install git && git --version
## TERRAFORM CLI ##
# RUN curl -O -L  https://releases.hashicorp.com/terraform/0.11.13/terraform_0.11.13_linux_amd64.zip && unzip terraform_0.11.13_linux_amd64.zip && mv ./terraform /usr/bin/ && terraform --version
## PIP CLI ##
# RUN apt-get update && apt-get -y install python-pip && pip -v
## UNZIP CLI ##
# RUN apt-get update && apt-get install unzip
## AWS CLI ##
# RUN curl -L -O "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" && unzip awscli-bundle.zip && ./awscli-bundle/install -b ~/bin/aws && /root/bin/aws --version
## CLOUD FOUNDRY CLI ##
# RUN sudo wget -O /etc/yum.repos.d/cloudfoundry-cli.repo https://packages.cloudfoundry.org/fedora/cloudfoundry-cli.repo && sudo yum -y install cf-cli
## DOCKER CLI ##
# RUN apt-get update && apt-get install -y apt-utils dnsutils docker
