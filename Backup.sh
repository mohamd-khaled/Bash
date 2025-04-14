#!/bin/bash

#created by mohamed khaled
#script to take backu a folder

#Variables
Src_Dir="/home/mohamed/Pictures"
Des_Dir="/home/mohamed/Desktop/Backup/"
Log_File="/home/mohamed/Desktop/Backup/backup.log"

#Functions

backup() {
	    rsync -avz "$Src_Dir" "$Des_Dir" > "$Log_File" 2>&1

	    if [ $? -eq 0 ];
	    then
		echo "backup success at $(date)" >> "$Log_File"
       	    else
		echo "backup failed at $(date)" >> "$Log_File"
	    fi
}


#Main
backup

#END
