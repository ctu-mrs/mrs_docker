#!/bin/bash

VERSION=1.5.0

LOCAL_TAG=mrs_uav_system:$VERSION
REGISTRY=ctumrs

# docker buildx create --name container-builder --driver docker-container --bootstrap --use
docker buildx use container-builder

docker buildx build . --file Dockerfile --tag $REGISTRY/$LOCAL_TAG --build-arg VERSION=${VERSION} --platform=linux/arm64,linux/amd64 --push
