#!/bin/sh

# there are other ways to do this but for now just do this:

# if you want to use the app to do self registration uncomment line
# and include the ID of a self registration profile here:
# export IDCS_SELFREGPROFILES=1234567890abcd1234567890abcdef12

# setting DEBUG_LOGIN to true will enable logging both in node.js and
# in your web browser's JavaScript console.
# this setting is intended for development and debugging purposes and shouldn't
# be turned on in production
#export DEBUG_LOGIN=true

# Setting NODE_ENV to "production" disables printing stack traces of any exceptions
# to the user's browser.
# If you want to change that for development purposes then comment this line.
#
# WARNING: When using this in production you should always have NODE_ENV=production
export NODE_ENV=production

if [ ! -e node_modules ]; then
    echo "INFO: Required node.js modules are missing! Installing them now..."
    npm install
    if [ $? -eq 1 ]; then
      rm -rf node_modules
      echo "ERROR: npm cannot get the required node.js modules!"
      echo "ERROR: If you need a proxy to reach the internet configure npm to use it with:"
      echo "ERROR:   npm config set proxy='<proxy_url>'"
      echo "ERROR:   npm config set https-proxy='<proxy_url>'"
      exit 1
    fi
fi

npm start

