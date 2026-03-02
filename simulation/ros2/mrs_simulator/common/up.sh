cd "$(dirname "$0")"
xhost +local:docker

docker compose --env-file ./stack.env up -d
sleep 2 # may be needed for GUI

xhost -local:docker
