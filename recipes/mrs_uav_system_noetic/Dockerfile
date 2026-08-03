ARG BASE_IMAGE=ctumrs/ros_noetic:latest
ARG PPA_VARIANT=unstable

FROM ${BASE_IMAGE}

ARG PPA_VARIANT

RUN apt-get update && curl https://ctu-mrs.github.io/ppa-${PPA_VARIANT}/add_ppa.sh | bash && \
    apt-get --no-install-recommends -y install ros-${ROS_DISTRO}-mrs-uav-system-full \
    gdb keyboard-configuration software-properties-common && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["/ros_entrypoint.sh"]
