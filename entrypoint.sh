#!/bin/bash
# get environment variables and set default ones
ENV_DOCKER_IMAGE=${DOCKER_IMAGE:?"Specify a docker image"}
ENV_TRIGGER_TOKEN=${TRIGGER_TOKEN:?"Specify a trigger token"}
ENV_CRONJOB_STRING=${CRONJOB_STRING:?"Specify a cronjob string"}

# set environment variables
export ENV_DOCKER_IMAGE ENV_TRIGGER_TOKEN ENV_CRONJOB_STRING

# create cronjob
echo "${ENV_CRONJOB_STRING} /usr/bin/curl --output /dev/null --silent -H \"Content-Type: application/json\" --data '{\"build\": true}' -X POST \"https://registry.hub.docker.com/u/${DOCKER_IMAGE}/trigger/${TRIGGER_TOKEN}/\"" > /etc/crontabs/root

# start crond
bash -c "crond -L /var/log/cron/cron.log && tail -F /var/log/cron/cron.log"
#bash -c "crond -f"