#!/bin/bash

# Check path file exists
if [ "$#" -ne 1 ]; then
  PATHFILE="NONE"
else
	PATHFILE="$1.csv"

	if [ ! -f "$SCRIPTPATH/../tsc_acs/routes/uniLei/$PATHFILE" ]; then
	  echo "$SCRIPTPATH/../tsc_acs/routes/uniLei/$PATHFILE Cannot be found"
	  exit 1
	fi
fi
