FROM ros:noetic

RUN export ROS_APT_SOURCE_VERSION=$(curl -s https://api.github.com/repos/ros-infrastructure/ros-apt-source/releases/latest | grep -F "tag_name" | awk -F\" '{print $4}') && \
    curl -Lso /tmp/ros-apt-source.deb "https://github.com/ros-infrastructure/ros-apt-source/releases/download/${ROS_APT_SOURCE_VERSION}/ros-apt-source_${ROS_APT_SOURCE_VERSION}.$(. /etc/os-release && echo $VERSION_CODENAME)_all.deb" && \
    rm -f /etc/apt/sources.list.d/ros1-latest.list /usr/share/keyrings/ros1-latest-archive-keyring.gpg && apt-get install -y /tmp/ros-apt-source.deb && \
    apt-get update && apt-get install --no-install-recommends -y ca-certificates curl sudo ros-noetic-desktop-full && \
    apt-get clean && rm -rf /tmp/ros-apt-source.deb /var/lib/apt/lists/*

CMD ["/ros_entrypoint.sh"]
