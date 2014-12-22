#!/bin/bash
# Check if existing config file exist, if so will use it.
 
  if [ -f /config/Settings.bak ]; then 
    mv /config/Settings.bak /config/Settings.cfg
  fi
  
 echo "*** Check if previous config exist, if so will use it..."  
  if [ -f /config/Settings.cfg ]; then   
    cp /config/Settings.cfg /config/Settings.bak
    mv /config/Settings.cfg /opt/plexconnect/Settings.cfg
  else
    /usr/bin/python /opt/plexconnect/Settings.py 
  fi
  echo "*** Creating symlink to config..."
  ln -s /opt/plexconnect/Settings.cfg /config/Settings.cfg

# Run the PlexConnect  
echo "*** Launching PlexConnect..."
exec /usr/bin/python /opt/plexconnect/PlexConnect.py

