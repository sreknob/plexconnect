#!/bin/bash

# Does the user specify a DNS
if [ -z "$DNS" ]; then
  echo "No user-specified DNS IP address, using Google DNS IP address"
else
  sed -i 's/ip_dnsmaster = 8.8.8.8/ip_dnsmaster =$DNS/g' /opt/plexconnect/settings.cfg
fi

exec /usr/bin/python /opt/plexconnect/PlexConnect.py
