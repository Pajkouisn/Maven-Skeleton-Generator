#!/bin/bash

path=`pwd`/sample 

#	Validate and try creating a directory.
while true; do
{
	#	Ensures that a valid target target folder name is entered.
	if [ -d "$path" ]; then
 	{ 	
		#	Control will enter here if $DIRECTORY exists.
		echo 'settings SAMPLE_MAVEN_PROJECT_PATH to ' $path
		export SAMPLE_MAVEN_PROJECT_PATH=$path
	        echo $SAMPLE_MAVEN_PROJECT_PATH
     		break		
	}
	else
		read -p "Please enter a valid directory path to where you imported the sample project (e.g. /tmp/sample/) : " path 
	fi
}	
done
