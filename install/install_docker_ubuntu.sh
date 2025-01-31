#!/bin/bash

# get the path to this script
MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd )`

## | -------------------- pre-install setup ------------------- |

sudo apt-get -y update

sudo apt-get -y install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

## | ---------------- download dockers gpg key ---------------- |

# Add Docker's official GPG key:
sudo apt-get -y update
sudo apt-get -y install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

## | ----------------- setup stable repository ---------------- |

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get -y update

## | ------------------ install docker engine ----------------- |

sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin qemu-user-static

# this should solve the problems with accessing docker socket
sudo usermod -aG docker $USER

sudo service docker start
