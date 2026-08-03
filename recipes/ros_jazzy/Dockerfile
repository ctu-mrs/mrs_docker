ARG BASE_IMAGE=ros:jazzy

FROM ${BASE_IMAGE}

# workaround interactive prompts during apt installations
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get dist-upgrade --no-install-recommends -y \ 
    ca-certificates curl sudo ros-${ROS_DISTRO}-desktop-full && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["/ros_entrypoint.sh"]
