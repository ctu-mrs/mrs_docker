#!/bin/bash

## --------------------------------------------------------------
## |                init stage, argument parsing                |
## --------------------------------------------------------------

# #{ init

# Absolute path to this script. /home/user/bin/foo.sh
SCRIPT=$(readlink -f $0)
# Absolute path this script is in. /home/user/bin
SCRIPTPATH=`dirname $SCRIPT`
cd "$SCRIPTPATH"

HELP="usage: ./up.sh [arguments]
Arguments:
-n                      Don't synchronize the workspace
"

if [ $# -ge 1 ]; then
  # shift
  OPTIND=1

  COPY_WORKSPACE=true

  while getopts "hH?:nN" opt; do
    case "$opt" in
      h|H|\?)
        echo "$HELP"
        exit 0
        ;;
      n|N)
        COPY_WORKSPACE=false
        ;;
    esac
  done
fi

# #}

## --------------------------------------------------------------
## |           init finished, let's run the containers          |
## --------------------------------------------------------------

source ./setup.sh

SHARED_DATA_FOLDER=shared_data
COLCON_BUILDER_PATH=./../colcon_workspace_builder

# remove the old workspace volume (if it is gonna be updated)
if $COPY_WORKSPACE; then
  echo "$0: removing old colcon_workspace volume"
  docker volume rm -f ${SESSION_NAME}_colcon_workspace > /dev/null
fi

echo "$0: removing old shared_data volume"
docker volume rm -f ${SESSION_NAME}_${SHARED_DATA_FOLDER} > /dev/null

# start the "init" container that primes the docker volumes
docker compose -p $SESSION_NAME --env-file ./stack.env up -d init

# copy the shared data into the "shared_data" volume
echo "$0: copying shared data"
tar -czh ./${SHARED_DATA_FOLDER} | docker compose -p ${SESSION_NAME} cp - init:/etc/docker

# if we should copy the compiled workspace
if $COPY_WORKSPACE && [ -e ${COLCON_BUILDER_PATH}/cache/etc/docker/colcon_workspace/install ]; then
  echo "$0: copying colcon workspace"

  # 1. compress the build & install folder from the workspace and pass it to the "colcon_workspace" volume
  tar -C ${COLCON_BUILDER_PATH}/cache/etc/docker --exclude build --exclude log -czh ./colcon_workspace | docker compose -p ${SESSION_NAME} cp - init:/etc/docker
fi

# start the main session, -d starts in detached mode (will not block the terminal)
docker compose -p $SESSION_NAME --env-file ./stack.env up -d
