#!/bin/bash

# get the path to this script
MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd )`

cd ${MY_PATH}

## --------------------------------------------------------------
## |                            setup                           |
## --------------------------------------------------------------

LOCAL_TAG=mrs_uav_system:latest
REGISTRY=ctumrs

# single-platform image can be stored locally
ARCH=linux/amd64
# ARCH=linux/arm64

## --------------------------------------------------------------
## |                            build                           |
## --------------------------------------------------------------

docker buildx use default

# build the docker image using the builder and export the results to the local docker registry
docker build . --file Dockerfile --tag $REGISTRY/$LOCAL_TAG --platform=${ARCH} ${OUTPUT}

echo ""
echo "$0: shared data were packed into '$LOCAL_TAG'"
echo ""
