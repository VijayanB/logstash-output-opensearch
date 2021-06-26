#!/bin/bash

# This is intended to be run the plugin's root directory. `dockerfiles/arm64/run.sh`
# Ensure you have Docker installed locally and set the VERSION and BUILD_DATE environment variable.
set -e

# Building plugin
./dockerfiles/build.sh


if [[ -z "${LOGSTASH_VERSION}" ]]; then
  echo "VERSION=7.13.2" > dockerfiles/arm64/.env
else
  echo "VERSION=$LOGSTASH_VERSION" > dockerfiles/arm64/.env
fi

echo "ARCH=arm64" >> dockerfiles/arm64/.env

echo 'shutdown existing docker cluster'
docker-compose  --file dockerfiles/arm64/docker-compose.yml down

echo 'build new docker image with latest changes'
docker-compose  --file dockerfiles/arm64/docker-compose.yml build

echo 'start docker cluster'
docker-compose --file dockerfiles/arm64/docker-compose.yml up

# steps to publish image to registry