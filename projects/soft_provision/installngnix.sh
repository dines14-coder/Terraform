#!/bin/bash
# write the shebang for the identification


until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
    sleep 1
done

# we are going to update the package and install the nginx

sudo apt-get update
sudo apt-get -y install nginx

#we are going to start the nginx 
service nginx start
