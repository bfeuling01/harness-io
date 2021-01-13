apt-get update

echo " "
echo "Install jq"
echo " "
apt-get install jq -y

# Install Python
echo " "
echo "Install python"
echo " "
apt-get install python -y

if which gcloud; then
  echo gcloud already installed
else

# Install the Google Cloud CLI tool tarball
  curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-291.0.0-linux-x86_64.tar.gz

#Unzip tarball
  tar zxvf google-cloud-sdk-291.0.0-linux-x86_64.tar.gz && cd google-cloud-sdk

# Install the CLI tool
  cat <<EOF | ./install.sh
n
y
EOF
  export PATH=$PATH:/opt/harness-delegate/google-cloud-sdk/bin
fi

export PATH=$PATH:/opt/harness-delegate/google-cloud-sdk/bin

gcloud components install beta --quiet

echo ${secrets.getValue("gae_sa")} | base64 -d > /root/gae_sa.json
