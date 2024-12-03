export BASE_IMAGE=ctumrs/mrs_uav_system:1.5.0

export OUTPUT_IMAGE=catkin_workspace:1.0.0

# location for the exported docker images using the `./export_image.sh` script
export EXPORT_PATH=~/docker

# CPU architecture for the output image
export ARCH=amd64

# path to the catkin workspace in the docker image
export WORKSPACE_PATH=etc/docker/catkin_workspace

# local path to the build cache
export CACHE_PATH=cache
