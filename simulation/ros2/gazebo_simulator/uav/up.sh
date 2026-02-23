#!/bin/bash

this_dir="$(dirname "$(realpath "$0")")"
cd "$this_dir"

xhost +local:docker

docker compose --env-file ./stack.env up -d
lazydocker

xhost -local:docker
