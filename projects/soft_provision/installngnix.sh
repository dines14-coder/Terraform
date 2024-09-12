#!/bin/bash
# write the shebang for the identification


until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
    sleep 1
done

# we are going to update the package and install the ngnix

sudo apt-get update
sudo apt-get -y install ngnix

#we are going to start the ngnix 
service ngnix starts
