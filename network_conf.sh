#!/bin/bash

#created by mohamed khaled
#script to automate network configuration

#Variables
Interface="eth1"
Static_IP="192.168.10.254"
CIDR="24"
Gateway="192.168.10.1"
DNS="8.8.8.8"


#functions
#function to make the network profile and its configuration
configure_static_ip() {
			echo "Configuring static IP...."
			sudo nmcli con add type ethernet autoconnect yes con-name $Interface ifname $Interface  #nmcli con is function to display all network profiles,
			sudo nmcli con mod "$Interface" ipv4.addresses "$Static_IP/$CIDR"			#nmcli con add to make profile,type of the profile,autoconnect or not
                        sudo nmcli con mod "$Interface" ipv4.gateway "$Gateway"					#con-name the name of profile and of interface
                        sudo nmcli con mod "$Interface" ipv4.dns "$DNS"
                        sudo nmcli con mod "$Interface" ipv4.method manual
			echo "Static IP configuration done."

}

#function to restart the network
restart_network() {
			echo "Restarting network service...."
			sudo nmcli con up "$Interface"
			echo "Network service restarted"
}

#function to display the network configuration
show_network_config() {
			echo "Current network configuration:"
			ip addr show "$Interface"
}

#function to automate the process
automate_config() {
			configure_static_ip
			restart_network
			show_network_config
}


#Main

automate_config

#END
