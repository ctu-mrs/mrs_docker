FROM ros:jazzy

RUN apt-get update && apt-get upgrade --no-install-recommends -y \ 
    ca-certificates curl sudo ros-${ROS_DISTRO}-desktop-full && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["/ros_entrypoint.sh"]
