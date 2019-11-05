#!/bin/bash

# To be run on the lure server
./transfer.py lure-server:/var/log/suricata/eve.json dataprc-server:/home/$USER/logs/
