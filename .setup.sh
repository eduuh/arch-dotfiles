#!/bin/bash

# set up my environment
# creating a hard link to my hosts.config file

sudo mv /etc/hosts /etc/hosts.bak
sudo ln .config/hosts /etc/hosts
