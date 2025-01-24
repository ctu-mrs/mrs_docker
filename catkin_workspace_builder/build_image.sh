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

source ./common_vars.sh

## --------------------------------------------------------------
## |                            build                           |
## --------------------------------------------------------------

# initialize the cache
[ ! -e ${CACHE_PATH}/${WORKSPACE_PATH} ] && mkdir -p ./${CACHE_PATH}/${WORKSPACE_PATH}

PASS_TO_DOCKER_BUILD="Dockerfile src ${CACHE_PATH}/${WORKSPACE_PATH}"

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

echo ""
echo "$0: building the user's workspace"
echo ""

# this first build compiles the contents of "src" and storest the intermediate
tar -czh $PASS_TO_DOCKER_BUILD 2>/dev/null | docker buildx build - --no-cache --target stage_cache_workspace --output ./${CACHE_PATH} --build-arg WORKSPACE_PATH=${WORKSPACE_PATH} --build-arg BASE_IMAGE=${BASE_IMAGE} --build-arg TRANSPORT_IMAGE=${TRANSPORT_IMAGE} --build-arg ARCH=${ARCH} --file Dockerfile --platform=linux/$ARCH

echo ""
echo "$0: packing the workspace into a docker image"
echo ""

# this second build takes the resulting workspace and storest in in a final image
# that can be deployed to a drone
docker buildx build . --no-cache --target stage_finalization --file Dockerfile --build-arg WORKSPACE_PATH=${WORKSPACE_PATH} --build-arg BASE_IMAGE=${BASE_IMAGE} --build-arg TRANSPORT_IMAGE=${TRANSPORT_IMAGE} --build-arg ARCH=${ARCH} --tag $OUTPUT_IMAGE --platform=linux/$ARCH

echo ""
echo "$0: workspace was packed into '$OUTPUT_IMAGE'"
echo ""
