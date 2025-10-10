#!/bin/bash

# get the path to this script
MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd )`

cd ${MY_PATH}

## --------------------------------------------------------------
## |                            setup                           |
## --------------------------------------------------------------

LOCAL_TAG=mrs_uav_system:unstable
REGISTRY=ctumrs

## --------------------------------------------------------------
## |                            build                           |
## --------------------------------------------------------------

# build the docker image using the builder and export the results to the local docker registry
docker build . --file Dockerfile --tag $REGISTRY/$LOCAL_TAG  --platform=linux/amd64
