#!/bin/bash

docker buildx build . --file Dockerfile --tag ctumrs/mrs_uav_system:custom --platform=linux/amd64,linux/arm64
