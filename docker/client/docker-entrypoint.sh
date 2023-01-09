#!/bin/sh
# Exit on fail
set -e

if [ "${APP_ENV}" = "local" ]; then
  yarn install && yarn dev
else
  yarn install --frozen-lockfile && yarn build && yarn start
fi

# Finally call command issued to the docker service
exec "$@"
