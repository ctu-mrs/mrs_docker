FROM ros:jazzy

RUN apt-get -y update

# workaround interractive prompts during apt installations
RUN echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install keyboard-configuration

# INSTALL the MRS UAV System

RUN apt-get -y install software-properties-common curl bash

RUN curl https://ctu-mrs.github.io/ppa2-unstable/add_ppa.sh | bash

RUN apt-get -y install ros-jazzy-mrs-uav-core
RUN apt-get -y install ros-jazzy-mrs-uav-px4-api
RUN apt-get -y install ros-jazzy-rmw-zenoh-cpp

CMD ["/ros_entrypoint.sh"]
