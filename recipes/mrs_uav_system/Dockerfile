FROM ctumrs/ros:noetic

RUN apt-get -y update

# workaround interractive prompts during apt installations
RUN echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install keyboard-configuration

# INSTALL the MRS UAV System

RUN apt-get -y install software-properties-common curl bash

RUN curl https://ctu-mrs.github.io/ppa-unstable/add_ppa.sh | bash

RUN apt-get -y install ros-noetic-mrs-uav-system-full

RUN apt-get -y install libgbm-dev gdb wpan-tools iproute2

#add mesa modules for using the integrated GPU
RUN add-apt-repository -y ppa:kisak/kisak-mesa && sudo apt-get -y install libglx-mesa0 libgl1-mesa-dri

CMD ["/ros_entrypoint.sh"]
