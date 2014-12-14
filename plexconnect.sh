#!/bin/bash

# Does the user specify a DNS
if [ -z "$DNS" ]; then
  echo "No user-specified DNS IP address, using Google DNS IP address"
else
  sed -i 's/8.8.8.8/$DNS/g' /opt/plexconnect/Settings.cfg
fi

exec /usr/bin/python /opt/plexconnect/PlexConnect.py
