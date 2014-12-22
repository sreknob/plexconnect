#!/bin/bash
# Check if existing config file exist, if so will use it.
  
 echo "*** Check if previous config exist, if so will use it..."  
  if [ -f /config/Settings.cfg ]; then   
    cp /config/Settings.cfg /opt/plexconnect/Settings.cfg
  else
    /usr/bin/python /opt/plexconnect/Settings.py 
  fi

# Run the PlexConnect  
echo "*** Launching PlexConnect..."
exec /usr/bin/python /opt/plexconnect/PlexConnect.py

