#!/bin/bash

if [ -f .env ]; then
  export $(echo $(cat .env | sed 's/#.*//g'| xargs) | envsubst)
fi

curl --silent https://$CONFIG_GIT_TOKEN:x-oauth-basic@raw.githubusercontent.com/ravensorb/ansible-server-setup/features/settingsfile/init-os-linux.sh | bash -s -- $@
