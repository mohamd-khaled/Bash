#!/bin/bash

#Created by mohamed khaled
#Script to make directories and html files i will use in learning the nginx web server

i=1
for ((i=1; i<4; i++)) do
		sudo mkdir -p "/var/www/${i}_website"
		cd  /var/www/${i}_website
		sudo chown -R nginx:nginx /var/www/${i}_website/
		sudo touch index.html
		if [ $i -eq 1 ]; then
			echo  "this is the first website" | sudo tee  index.html
		elif [ $i -eq 2 ]; then
                        echo "this is the second website, and its port number has been changed" | sudo tee index.html
                else
                      echo  "this is the third website, it asks for authentication  and the old.com site redirected to this" | sudo tee index.html
		fi
done

#END
