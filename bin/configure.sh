#!/usr/bin/env bash

until curl -Is http://localhost:8080/openam/config/options.htm | head -n 1 | grep "200 OK" >/dev/null; do
    echo "Waiting for complete startup OpenAM"
    sleep 5
done

cat <<EOF > /home/openam/conf/configurator.conf
SERVER_URL=http://$(hostname):8080
DEPLOYMENT_URI=/openam
BASE_DIR=/openam
locale=en_US
PLATFORM_LOCALE=en_US
AM_ENC_KEY=AM_ENC_KEY
ADMIN_PWD=password_openam
AMLDAPUSERPASSWD=password_opendj
COOKIE_DOMAIN=.example.com
ACCEPT_LICENSES=true
DATA_STORE=embedded
DIRECTORY_SSL=SIMPLE
DIRECTORY_SERVER=$(hostname)
DIRECTORY_PORT=50389
DIRECTORY_ADMIN_PORT=4444
DIRECTORY_JMX_PORT=1689
ROOT_SUFFIX=dc=openam,dc=forgerock,dc=org
DS_DIRMGRDN=cn=Directory Manager
DS_DIRMGRPASSWD=password_opendj
EOF

cd /home/openam/conf
java -jar openam-configurator-tool-${OPENAM_VERSION}.jar --file configurator.conf -DSERVER_URL=http://$(hostname):8080
