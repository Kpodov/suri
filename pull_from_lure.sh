#!/bin/bash
mkdir ~/logs

# To be run on the data processing server
./transfer.py --pull lure-server:/var/log/suricata/eve.json dataprc-server:/home/$USER/logs/
