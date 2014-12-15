#!/bin/bash

# Does the user specify a DNS
if [ -z "$DNS" ]; then
  echo "No user-specified DNS IP address, using Google DNS IP address"
  exec /usr/bin/python /opt/plexconnect/PlexConnect.py
else
  echo "DNS Variable exist, will use it in PlexConnect"
  /usr/bin/python /opt/plexconnect/Settings.py
  echo "Replacing ip_dnsmaster=8.8.8.8 by ip_dnsmaster=$DNS in Settings.cfg file..."
  sed -i 's/8.8.8.8/'$DNS'/g' /opt/plexconnect/Settings.cfg
  echo "Launching PlexConnect with the new Settings.cfg..."
  exec /usr/bin/python /opt/plexconnect/PlexConnect.py
fi


