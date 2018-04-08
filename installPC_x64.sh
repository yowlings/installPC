#!/bin/bash
echo -e "\033[44;31;5m step1: \033[0m install basic tools......"
sudo apt-get update
sudo apt-get install git -y
sudo apt-get install ssh -y
echo -e "\033[44;31;5m step2: \033[0m build the device ports mapping rules......"
sudo apt-get update
sudo cp 58-xbot.rules /etc/udev/rules.d/
sudo service udev restart
echo -e "\033[44;31;5m step3: \033[0m add ROS repository......"
sudo apt-get update
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
# Setup keys
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
# Installation
sudo apt-get update
echo -e "\033[44;31;5m step4: \033[0m install ros-kinetic-desktop-full......"
sudo apt-get install ros-kinetic-desktop-full -y
# Add Individual Packagejis here
# You can install a specific ROS package (replace underscores with dashes of the package name):
# sudo apt-get install ros-kinetic-PACKAGE
# e.g.
# sudo apt-get install ros-kinetic-navigation
#
# To find available packages:
# apt-cache search ros-kinetic
# 
# Initialize rosdep
sudo apt-get install python-rosdep -y

# Initialize rosdep
sudo rosdep init
# To find available packages, use:
rosdep update
# Environment Setup
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
# Install rosinstall
echo -e "\033[44;31;5m step5: \033[0m install xbot2 depend softwares......"
sudo apt-get install python-rosinstall -y
sudo apt-get install ros-kinetic-yocs-cmd-vel-mux -y
sudo apt-get install ros-kinetic-controller-manager -y
sudo apt-get install ros-kinetic-move-base -y
sudo apt-get install ros-kinetic-move-base-msgs -y
sudo apt-get install ros-kinetic-hector-slam -y
sudo apt-get install ros-kinetic-gmapping -y
sudo apt-get install ros-kinetic-dwa-local-planner -y
sudo apt-get install ros-kinetic-robot-upstart -y
sudo apt-get install ros-kinetic-ecl -y


./setupCatkinWorkspace.sh


echo -e "\033[44;31;5m step6: \033[0m get xbot2 package and catkin_make......"
cd 
git clone https://github.com/DroidAITech/xbot2.git ~/catkin_ws/src/xbot2/
source ~/.bashrc
cd ~/catkin_ws
catkin_make





