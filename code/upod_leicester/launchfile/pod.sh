#!/bin/bash

# Get script location
SCRIPTPATH="$(dirname "$(readlink -f "$0")")"

# Check path file exists
. $SCRIPTPATH/auxFiles/checkPathFileExists.sh $1

catkin_make sparkfun_compass_firmware_compass
catkin_make sparkfun_compass_firmware_compass-upload

catkin_make vehicle_motion_firmware_motion
catkin_make vehicle_motion_firmware_motion-upload



## Launch nodes
roslaunch $SCRIPTPATH/back.launch 
