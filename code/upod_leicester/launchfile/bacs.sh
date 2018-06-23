#!/bin/bash

# Get script location
SCRIPTPATH="$(dirname "$(readlink -f "$0")")"

## Launch nodes
roslaunch $SCRIPTPATH/bacs.launch folder:=$SCRIPTPATH/../routes/mk fencefile:=$SCRIPTPATH/../fences/empty.csv origin:=52.038,-0.768
