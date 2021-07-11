#!/bin/bash

# configure SATIP server name/IP address, here
SERVER="AmerSatIP"
#SERVER="192.168.0.134"

# cleanup old files
rm *.php
rm *.m3u

# download PHP files from kingofsat
wget https://de.kingofsat.net/sat-nilesat201.php
wget https://de.kingofsat.net/sat-ab7.php

# call python script to extract channel information from php files and generate m3u files
# the number at the end of the call is the satip src parameter (diseqc position)
python getchannels.py $SERVER sat-nilesat201.php 1
python getchannels.py $SERVER sat-ab7.php 2

# merge all m3u files together
cat *.m3u > allChannels.m3u
