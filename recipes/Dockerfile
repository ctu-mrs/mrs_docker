FROM ctumrs/mrs_uav_system:latest

RUN apt-get -y update

# workaround interractive prompts during apt installations
RUN echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install keyboard-configuration

# update
# RUN apt-get -y update && apt-get -y upgrade --with-new-pkgs --allow-downgrades

CMD ["bash"]
