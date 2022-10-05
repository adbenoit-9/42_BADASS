#!/bin/bash

#####################################################
# *** INSTALL GNS3 & DOCKER ***                     #
# 	- GNS3 :	sudo add-apt-repository ppa:gns3/ppa  #
# 			      sudo apt update                       #
# 			      sudo apt install gns3-gui             #
#                                                   #
# 	- DOCKER : 	sudo apt install docker.io          #
# 			        sudo usermod -a -G docker codebrai  #
#####################################################

# Construction of Docker images
sudo docker build -t alpine -f ./alpine .
sudo docker build -t new_frrouting -f ./new_frrouting .
