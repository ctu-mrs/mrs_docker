cd "$(dirname "$0")"
docker compose --env-file ./stack.env up -d
