#!/bin/bash

# Get script location
SCRIPTPATH="$(dirname "$(readlink -f "$0")")"

# Check path file exists
. $SCRIPTPATH/auxFiles/checkPathFileExists.sh $1

# Mount disk
#. $SCRIPTPATH/auxFiles/mountDisk.sh

# Start Can
#. $SCRIPTPATH/auxFiles/startCan.sh
# Initiate CAN channels
#echo "Initiating can channels"

## Can channels down and then up
#sudo ip link set can0 down
#sudo ip link set can1 down

#sudo ip link set can0 up type can bitrate 500000
#sudo ip link set can1 up type can bitrate 500000

## Launch nodes
roslaunch $SCRIPTPATH/drive_by_wire.launch
