#!/bin/bash

# get the path to this script
MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd )`

cd ${MY_PATH}

## --------------------------------------------------------------
## |                            setup                           |
## --------------------------------------------------------------

LOCAL_TAG=ros_jazzy:latest
REGISTRY=ctumrs

# single-platform image can be stored locally
# ARCH=linux/amd64
# ARCH=linux/arm64

## --------------------------------------------------------------
## |                            build                           |
## --------------------------------------------------------------

docker buildx create --name container --driver=docker-container --use

# build the docker image using the builder and export the results to the local docker registry
docker buildx build . --file Dockerfile --tag $REGISTRY/$LOCAL_TAG --tag $REGISTRY/ros_jazzy:2025-03-10 --platform=linux/amd64,linux/arm64 --push 

echo ""
echo "$0: shared data were packed into '$LOCAL_TAG'"
echo ""
