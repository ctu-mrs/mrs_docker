#!/bin/bash

LOCAL_TAG=mrs_uav_system:robofly
REGISTRY=ctumrs

docker buildx create --name container-builder --driver docker-container --bootstrap --use

docker buildx build . --file Dockerfile --tag $REGISTRY/$LOCAL_TAG --platform=linux/arm64 --push

