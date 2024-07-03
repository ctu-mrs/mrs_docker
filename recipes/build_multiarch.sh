#!/bin/bash

docker buildx create --name container --driver=docker-container
docker buildx build --push . --file Dockerfile --builder container --tag ctumrs/mrs_uav_system:latest --platform=linux/amd64,linux/arm64
