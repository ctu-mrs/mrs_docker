ARG BASE_IMAGE=ctumrs/ros_jazzy:latest
ARG PPA_VARIANT=unstable

FROM ${BASE_IMAGE}

ARG PPA_VARIANT

# workaround interractive prompts during apt installations
RUN echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections && \
    apt-get -y update && DEBIAN_FRONTEND=noninteractive apt-get --no-install-recommends -y install \
    keyboard-configuration software-properties-common bash && \
    # INSTALL the MRS UAV System
    curl https://ctu-mrs.github.io/ppa2-${PPA_VARIANT}/add_ppa.sh | bash && \
    apt-get --no-install-recommends -y install ros-jazzy-mrs-uav-system-full ros-jazzy-mavros-extras gdb && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["/ros_entrypoint.sh"]
