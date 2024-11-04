docker compose --env-file ./stack.env down -v --remove-orphans
docker network prune -f
