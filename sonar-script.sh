#!/bin/bash

CHANGED_FILES=""
for FILE_NAME in `git diff --name-only HEAD HEAD~1`;
  do 
	 CHANGED_FILES+="${FILE_NAME},"
  done

if [ $CHANGED_FILES ];
then
    _INCLUDED_FILES_LIST_="$CHANGED_FILES" envsubst < sonar-project.sample > sonar-project.properties
    ./runScanner.sh
else
    echo "No need to run sonar scanner."
fi