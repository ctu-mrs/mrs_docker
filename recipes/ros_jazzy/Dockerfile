FROM ros:jazzy

RUN apt-get update && apt-get install -y ca-certificates curl sudo

RUN apt-get -y install ros-jazzy-desktop-full

CMD ["/ros_entrypoint.sh"]
