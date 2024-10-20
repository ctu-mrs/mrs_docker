#!/bin/bash

LOCAL_TAG=custom_package:1.0.0

docker save $LOCAL_TAG --output custom_package.tar
