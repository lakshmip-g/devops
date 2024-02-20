#!/bin/bash
# Script to create a user on multiple hosts 
hosts=$(cat hosts.txt)

# Read username from the prompt
echo -n "Enter the username to be added to the hosts: "
read username
# Read userid from the prompt
echo -n "Enter the user id to be added to the hosts: "
read userid
# Loop through all the hosts
for h in $hosts; do
echo $h
ssh $h "sudo useradd -m -u $userid $username"
if [ $? -eq 0 ]; then
# Print all the usernames on hosts
echo "User $username added on $h"
else
# Print in case of any errors
echo "Error on $h"
fi
done