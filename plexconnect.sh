#!/bin/bash

#Creating Default Settings.cfg 
  /usr/bin/python /opt/plexconnect/Settings.py

# Does the user specify a DNS
if [ -z "$DNS" ]; then
  echo "No user-specified DNS IP address, using Google DNS IP address"
else
  echo "DNS Variable exist, will use it in PlexConnect"
  echo "Replacing ip_dnsmaster=8.8.8.8 by ip_dnsmaster=$DNS in Settings.cfg file..."
  sed -i 's/8.8.8.8/'$DNS'/g' /opt/plexconnect/Settings.cfg
  echo "Launching PlexConnect with the new Settings.cfg..."
fi

# Does the user specified a Alternate HTTP Port ?
if [ -z "$HTTP_Port" ]; then
  echo "No specific HTTP Port specified, using default (80)..."
else
  echo "A Specific HTTP Port has been specified, using ('$HTTP_Port')..."
  sed -i 's/port_webserver=80/port_webserver='$HTTP_Port'/g' /opt/plexconnect/Settings.cfg
fi  

# Does the user specified a Alternate HTTPS Port ?  
if [ -z "$HTTPS_Port" ]; then
  echo "No specific HTTP Port specified, using default (80)..."
else
  echo "A Specific HTTP Port has been specified, using ('$HTTPS_Port')..."
  sed -i 's/port_ssl=443/port_ssl='$HTTPS_Port'/g' /opt/plexconnect/Settings.cfg
fi  
  
# Run the PlexConnect  
  exec /usr/bin/python /opt/plexconnect/PlexConnect.py
