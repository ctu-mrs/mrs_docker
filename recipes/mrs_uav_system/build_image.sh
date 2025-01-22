#!/bin/bash

set -e

trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "$0: \"${last_command}\" command failed with exit code $?"' ERR

# get the path to this script
MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd )`

cd ${MY_PATH}

## --------------------------------------------------------------
## |                            setup                           |
## --------------------------------------------------------------

LOCAL_TAG=mrs_uav_system:latest
REGISTRY=ctumrs

ARCH=amd64
# ARCH=arm64 # robofly

## --------------------------------------------------------------
## |                            build                           |
## --------------------------------------------------------------

docker buildx use default

docker buildx build . --file Dockerfile --tag $REGISTRY/$LOCAL_TAG --platform=linux/${ARCH}

echo ""
echo "$0: shared data were packed into '$LOCAL_TAG'"
echo ""
