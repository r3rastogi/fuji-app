#!/bin/bash

set -e

HEROKUCLI_DIR=/usr/bin

echo "Login to Heroku.."

cat >~/.netrc <<EOF
machine api.heroku.com
  login $HEROKU_EMAIL
  password $HEROKU_TOKEN
machine git.heroku.com
  login $HEROKU_EMAIL
  password $HEROKU_TOKEN
EOF

chmod 600 ~/.netrc

echo "Create Heroku app.."
cd ${SOURCE_DIR}/app
${HEROKUCLI_DIR}/heroku create

echo "Deploy Heroku app.."
git push heroku heroku:master