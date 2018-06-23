#!/bin/bash

# Get script location
SCRIPTPATH="$(dirname "$(readlink -f "$0")")"

# Check path file exists
. $SCRIPTPATH/auxFiles/checkPathFileExists.sh $1


ROUTE_FOLDER="$SCRIPTPATH/../tsc_acs/routes/uniLei"
FENCE_FILE="$SCRIPTPATH/../tsc_acs/fences/empty.csv"

# please revise the original location 
ORIGIN="51.8971203,-2.0776401"
MAX_SPEED="1.0"
REPLAY_MIN_LOOK_AHEAD_DISTANCE="0.5"

## Launch nodes
roslaunch $SCRIPTPATH/back.launch &

echo "Sleep start  ************************************************************************************************"
sleep 10
echo "Sleep end    ************************************************************************************************"

## Launch nodes
roslaunch $SCRIPTPATH/front.launch folder:=$ROUTE_FOLDER fencefile:=$FENCE_FILE origin:=$ORIGIN max_speed:=$MAX_SPEED replay_min_look_ahead_distance:=$REPLAY_MIN_LOOK_AHEAD_DISTANCE




