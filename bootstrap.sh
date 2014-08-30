#!/usr/bin/env bash
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list'
wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | sudo apt-key add -

sudo aptitude update -y
sudo aptitude install -y build-essential git vim 
sudo aptitude install -y python libpq-dev python-dev python-setuptools python-virtualenv
sudo aptitude install -y ros-indigo-desktop-full ubuntu-desktop
sudo rosdep init
rosdep update -y
echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
source /opt/ros/indigo/setup.bash
source ~/.bashrc
sudo aptitude install -y python-rosinstall

mkdir -p ~/catkin_workspace/src
cd ~/catkin_workspace/ 
catkin_make
cd ~
echo "source ~/catkin_workspace/devel/setup.bash" > ~/.bashrc
