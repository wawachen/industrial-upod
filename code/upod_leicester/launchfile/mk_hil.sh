#!/bin/bash

# Get script location
SCRIPTPATH="$(dirname "$(readlink -f "$0")")"

# Check path file exists
#. $SCRIPTPATH/auxFiles/checkPathFileExists.sh $1

# Mount disk
#. $SCRIPTPATH/auxFiles/mountDisk.sh

# Start Can
#. $SCRIPTPATH/auxFiles/startCan.sh
# Initiate CAN channels
echo "Initiating can channels"

## Can channels down and then up
#sudo ip link set can0 down
#sudo ip link set can1 down

#sudo ip link set can0 up type can bitrate 500000
#sudo ip link set can1 up type can bitrate 500000


ROUTE_FOLDER="$SCRIPTPATH/../routes/mk"
FENCE_FILE="$SCRIPTPATH/../fences/empty.csv"
ORIGIN="52.038,-0.768"
MAX_SPEED="5.0"


## Launch nodes
roslaunch $SCRIPTPATH/hil.launch folder:=$ROUTE_FOLDER fencefile:=$FENCE_FILE origin:=$ORIGIN max_speed:=$MAX_SPEED

