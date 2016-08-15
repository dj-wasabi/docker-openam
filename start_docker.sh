#!/usr/bin/env bash

if [[ $(docker ps | grep kibanatest | wc -l) -eq 0 ]]
    then docker run -d --name openam_${env.BRANCH_NAME} openam:${env.BRANCH_NAME}
fi