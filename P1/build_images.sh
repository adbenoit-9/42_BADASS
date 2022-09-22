#!/bin/bash

# Construction of Docker images
sudo docker build -t alpine -f ./alpine .
sudo docker build -t new_frrouting -f ./new_frrouting .
