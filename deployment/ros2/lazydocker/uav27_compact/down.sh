#!/bin/bash

# Absolute path to this script. /home/user/bin/foo.sh
SCRIPT=$(readlink -f $0)
# Absolute path this script is in. /home/user/bin
SCRIPTPATH=`dirname $SCRIPT`
cd "$SCRIPTPATH"

source ./setup.sh

docker compose -p $SESSION_NAME --env-file ./stack.env down --remove-orphans --timeout 1
docker network prune -f
