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

ARCH=amd64
# ARCH=arm64 # robofly

## --------------------------------------------------------------
## |                            build                           |
## --------------------------------------------------------------

docker buildx create --name container-builder --driver docker-container --bootstrap --use

docker buildx build . --file Dockerfile --tag $REGISTRY/$LOCAL_TAG --platform=linux/${ARCH}

docker buildx use default

echo ""
echo "$0: shared data were packed into '$LOCAL_TAG'"
echo ""
