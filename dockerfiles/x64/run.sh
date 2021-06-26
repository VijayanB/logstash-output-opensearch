#!/bin/bash

# This is intended to be run the plugin's root directory. `dockerfiles/arm64/run.sh`
# Ensure you have Docker installed locally and set the VERSION and BUILD_DATE environment variable.
set -e

# Building plugin
./dockerfiles/build.sh


if [[ -z "${LOGSTASH_VERSION}" ]]; then
  echo "VERSION=7.13.2" > dockerfiles/x64/.env
else
  echo "VERSION=$LOGSTASH_VERSION" > dockerfiles/x64/.env
fi

echo "ARCH=amd64" >> dockerfiles/x64/.env

echo 'shutdown existing docker cluster'
docker-compose  --file dockerfiles/x64/docker-compose.yml down

echo 'build new docker image with latest changes'
docker-compose  --file dockerfiles/x64/docker-compose.yml build

# steps to publish image to registry
