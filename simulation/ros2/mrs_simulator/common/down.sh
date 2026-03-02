this_dir="$(dirname "$0")"

docker compose -f "$this_dir/compose.yaml" --env-file "$this_dir/stack.env" down -v --remove-orphans --timeout 1
docker network prune -f
