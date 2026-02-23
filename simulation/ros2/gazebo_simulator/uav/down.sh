#!/bin/bash

this_dir="$(dirname "$(realpath "$0")")"
cd "$this_dir"

docker compose --env-file ./stack.env down -v --remove-orphans --timeout 1
docker network prune -f
