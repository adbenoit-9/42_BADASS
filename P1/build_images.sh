#!/bin/bash

#################################################################################
# *** INSTALL GNS3 & DOCKER ***
# 	- GNS3 :	sudo add-apt-repository ppa:gns3/ppa
# 			    sudo apt update
# 			    sudo apt install gns3-gui
#
# 	- DOCKER : 	sudo apt install docker.io
# 			    sudo usermod -a -G docker codebrai
#################################################################################
#################################################################################
# *** PARTIE I : Configuration de GNS3 avec Docker ***
# 	- MANIP :
# 		- pull les images de alpine et frrouting/frr
# 		- creer un nouveau projet GNS3
# 		- importer l'image de frrouting
# 		- ouvrir la console auxiliaire pour modifier etc/frr/daemons
# 		- activer bgpd / ospfd / isisd
# 		- docker commit les changements dans une nouvelle image
# 		- importer la nouvelle image du routeur, changer son symbole et son nom
# 		- importer l'image de alpine, changer son nom
# 		- exporter le projet GNS3 en zip incluant les bases images
# 	- TEST :
# 		- bash build_images.sh (build les images alpine et frrouting avec notre
# 			fichier de conf daemons)
# 		- importer le projet dans GNS3
# 		- lancer le projet / verifier que l'host et le routeur sont connectes
# 		- < ps > dans les deux consoles auxiliaires pour verifier que tout
# 			fonctionne correctement
#################################################################################

# Construction of Docker images
sudo docker build -t alpine -f ./alpine .
sudo docker build -t new_frrouting -f ./new_frrouting .
