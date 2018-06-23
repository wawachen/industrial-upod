#!/bin/bash

# Get script location
SCRIPTPATH="$(dirname "$(readlink -f "$0")")"

ROUTE_FOLDER="$SCRIPTPATH/../routes/mk"
FENCE_FILE="$SCRIPTPATH/../fences/empty.csv"
ORIGIN="52.038,-0.768"
MAX_SPEED="5.0"

## Launch nodes
roslaunch $SCRIPTPATH/sim_pod.launch folder:=$ROUTE_FOLDER fencefile:=$FENCE_FILE origin:=$ORIGIN max_speed:=$MAX_SPEED
