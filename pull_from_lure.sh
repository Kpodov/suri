#!/bin/bash
mkdir ~/logs
transfer.py --pull lure-server:/var/log/suricata/eve.json dataprc-server:/home/$USER/logs/
