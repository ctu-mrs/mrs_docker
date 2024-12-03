# MRS UAV System docker environment

## Installing docker

```bash
./install/install_docker_ubuntu.sh
```

## Example simulation sessions

### MRS Simulator

```bash
cd ./compose/mrs_simulator
docker compose up
```

### Gazebo simulator

```bash
cd ./compose/gazebo_simulator
docker compose up
```

## Stopping the simulation

```bash
docker compose down -v --remove-orphans
docker network prune
```

## TODO

  * container health checks for proper dependencies
  * `docker network prune` for cleaning networks
  * `xhost si:localuser:root` for piping windows
