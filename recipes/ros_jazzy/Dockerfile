FROM ros:jazzy

RUN apt-get update && apt-get install --no-install-recommends -y \ 
    ca-certificates curl sudo ros-jazzy-desktop-full ros-jazzy-rmw-zenoh-cpp && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["/ros_entrypoint.sh"]
