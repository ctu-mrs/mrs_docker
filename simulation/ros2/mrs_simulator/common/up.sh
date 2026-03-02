xhost +local:docker
this_dir="$(dirname "$0")"

docker compose -f "$this_dir/compose.yaml" --env-file "$this_dir/stack.env" up -d
sleep 2 # may be needed for GUI

xhost -local:docker
