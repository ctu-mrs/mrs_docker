#!/bin/bash

docker buildx build . --file Dockerfile --tag ctumrs/mrs_uav_system:latest --platform=aarch64
