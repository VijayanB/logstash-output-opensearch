#!/bin/bash

# This is intended to be run inside the docker container as the command of the docker-compose.
set -ex

cd scripts/unit-test;
# request codecov to detect CI environment to pass through to docker
CI_ENV=`bash <(curl -s https://codecov.io/env)`

docker-compose up --exit-code-from logstash logstash
bash <(curl -s https://codecov.io/bash)
