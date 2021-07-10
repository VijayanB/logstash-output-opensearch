#!/bin/bash
set -ex

export PATH=$BUILD_DIR/gradle/bin:$PATH
ci_env=`curl -s https://codecov.io/env`

bundle exec rspec -fd spec/unit -t ~integration

bash <(curl -s https://codecov.io/bash) -f coverage/coverage.xml
