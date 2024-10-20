#!/bin/bash

LOCAL_TAG=ctumrs/mrs_uav_system:robofly
REGISTRY=localhost:5000

docker buildx create --name container-builder --driver docker-container --bootstrap --use

docker buildx build . --file Dockerfile --tag $REGISTRY/$LOCAL_TAG --platform=linux/arm64 --push
