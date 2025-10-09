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

# multiplatform builder
BUILDER=container-builder

# get info about an existing builder
container_builder_info=$(docker buildx inspect ${BUILDER})

if [[ "$?" == "0" ]]; then
  # activate the builder if it exists
  docker buildx use ${BUILDER}
else
  # create the builder if it does not exist
  docker buildx create --name ${BUILDER} --driver docker-container --bootstrap --use
fi

# build the docker image using the builder and export the results to the local docker registry
docker buildx build . --no-cache --file Dockerfile --tag $REGISTRY/$LOCAL_TAG --tag $REGISTRY/ros_jazzy:2025-10-09 --platform=linux/amd64,linux/arm64 --push 
