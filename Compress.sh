#!/bin/bash

#created by mohamed khaled
#scripte to make a backup of etc and compress it if user is root

if [ $UID -eq 0 ]; then
        mkdir /backup
        cp -R /etc /backup/etc_backup_$(date +"%m_%d_%Y").tar.gz
fi

#END
