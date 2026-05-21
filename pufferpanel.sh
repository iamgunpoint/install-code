#!/bin/bash
curl -s https://packagecloud.io/install/repositories/pufferpanel/pufferpanel/script.deb.sh?any=true | sudo bash
apt update
apt install -y pufferpanel
pufferpanel user add