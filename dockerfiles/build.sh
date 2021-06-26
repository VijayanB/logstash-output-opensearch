#!/bin/bash

# This is intended to be run the plugin's root directory. `dockerfiles/run.sh`
# Ensure you have Docker installed locally and set the VERSION and BUILD_DATE environment variable.
set -e

if [ -d dockerfiles/bin ]; then
  rm -rf dockerfiles/bin
fi

mkdir -p dockerfiles/bin

echo 'Building plugin'
gem build logstash-output-opensearch.gemspec

echo "Moving gem to bin directory"
mv logstash-output-opensearch*.gem dockerfiles/bin/
