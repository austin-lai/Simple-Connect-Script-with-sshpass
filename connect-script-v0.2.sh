#!/bin/bash

# Display Help or Usage
display_usage() { 
	echo -e "\nThis script to ssh to target with sshpass ...\n" 
    echo -e "./connect-script-v0.2.sh "test" 22222 test 192.168.0.100\n"
	echo -e "Usage: $0 <'password' | \"password\"> <target ssh port> <target ssh username> <target ip>\n" 
} 

# If less than one arguments supplied, display usage 
if [  $# -lt 4 ] 
then 
	display_usage
	exit 1
fi 

# Check whether user had supplied -h or --help . If yes display usage 
if [[ ( $# == "--help") ||  $# == "-h" ]] 
then 
	display_usage
	exit 0
fi 


# Set your variable
password=$1
target_ssh_port=$2
target_ssh_username=$3
target_ipaddr=$4

echo -e "\nPassword = $password"
echo "Target SSH Port = $target_ssh_port"
echo "Target Username = $target_ssh_username"
echo -e "Target SSH IP = $target_ipaddr \n"

sshpass -v -p $password ssh -v -o StrictHostKeyChecking=no -p $target_ssh_port $target_ssh_username@$target_ipaddr
