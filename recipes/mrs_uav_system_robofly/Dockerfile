FROM ctumrs/ros:noetic

# INSTALL the MRS UAV System

RUN apt-get -y update

RUN apt-get -y install software-properties-common curl bash

RUN curl https://ctu-mrs.github.io/ppa-unstable/add_ppa.sh | bash

RUN apt-get -y install ros-noetic-mrs-uav-system-full

CMD ["/ros_entrypoint.sh"]
