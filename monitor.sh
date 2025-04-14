#!/bin/bash

#created by mohamed khaled
#script to monitor the resource usage

#Variables
CPU_threshold=50
MEM_threshold=50
Disk_threshold=50

#functions
check_cpu_usage() {
		      CPU_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}') #top is task manager, -bn1 for 1 iteration | grep to get the cpu usage only |
		      								    #awk it takes text, splits it into fields and give them reference $1, $2, and so on, we take $2 and $4
										    #which refer to user cpu usage and kernel usage and sumto get total usage

		      if (( $(echo "$CPU_usage > $CPU_threshold" | bc -l) )); then    #line to compare cpu usage and cpu threshold  we cant use noraml -gt cause it is for integars only
		    		echo "ALERT: High CPU usage! CPU usage = $CPU_usage"  #with floats will throw an error, we use echo to print the compare and then give it to bc which is
		      fi							      #command line calculator and add -l argument to load math libaray

}

check_mem_usage() {
                      MEM_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}') #free give memory and swap usage after ak the total memory will be $2 and used $3

                      if (( $(echo "$MEM_usage > $MEM_threshold" | bc -l) )); then
                                echo "ALERT: High memory usage! memory usage = $MEM_usage"
                      fi

}

check_disk_usage() {
		    	Disk_usage=$(df / | tail -1 | awk '{print $5}' | sed 's/%//') #df / show the disk usage of root, tail -1 to remove the header, sed to replace something s/old/new/

			if(( $(echo "$Disk_usage > $Disk_threshold" | bc -l) ));
			then
   				 echo "ALERT: High Disk usage! Disk usage =  $Disk_usage%"
			fi
}

#Run the functions
check_cpu_usage
check_mem_usage
check_disk_usage

#END
