#!/bin/bash

LOCAL_TAG=ros:noetic
REGISTRY=ctumrs

docker buildx create --name container-builder --driver docker-container --bootstrap --use

docker buildx use container-builder

docker buildx build . --file Dockerfile --tag $REGISTRY/$LOCAL_TAG --platform=linux/arm64,linux/amd64 --push
