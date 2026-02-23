docker compose --env-file ./stack.env down -v --remove-orphans --timeout 1
docker network prune -f
