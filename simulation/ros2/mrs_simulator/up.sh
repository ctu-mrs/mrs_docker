xhost +local:docker

docker compose --env-file ./stack.env up -d
lazydocker

xhost -local:docker
