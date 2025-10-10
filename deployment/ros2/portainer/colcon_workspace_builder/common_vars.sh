# tag for the source image agains which the colcon workspace will be built
export BASE_IMAGE=ctumrs/mrs_uav_system:stable

# tag for the 'transport' image used for packing the workspace
export TRANSPORT_IMAGE=alpine:latest

# tag for the resulting image in which the workspace will be packged
export OUTPUT_IMAGE=colcon_workspace:latest

# location for the exported docker images using the `./export_image.sh` script
export EXPORT_PATH=~/docker

# CPU architecture for the output image
export ARCH=amd64

# path to the colcon workspace in the docker image
export WORKSPACE_PATH=etc/docker/colcon_workspace

# local path to the build cache
export CACHE_PATH=cache
