this_dir="$(dirname "$0")"
docker compose -f "$this_dir/compose.yaml" --env-file "$this_dir/stack.env" up -d
