#!/bin/bash

# This is intended to be run inside the docker container as the command of the docker-compose.
set -ex

cd scripts/unit-test;
ci_env=`bash <(curl -s https://codecov.io/env)`
docker-compose up --exit-code-from logstash logstash
