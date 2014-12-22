#!/bin/bash

# Check if existing config file exist, if so will use it.
if [ -f /config/Settings.cfg ]; then
  echo "Using existing config file."
  ls -s /opt/plexconnect/Settings.cfg /config/Settings.cfg
else #if not, create a new one.
  echo "Creating new default config file."
  /usr/bin/python /opt/plexconnect/Settings.py
  mv /opt/plexconnect/Settings.cfg /opt/plexconnect/Settings-backup.cfg
  ls -s /opt/plexconnect/Settings.cfg /config/Settings.cfg
  mv /opt/plexconnect/Settings-backup.cfg /config/Settings.cfg
  chown nobody:users /config/Settings.cfg
fi

# Run the PlexConnect  
echo "*** Launching PlexConnect with the new Settings.cfg..."
exec /usr/bin/python /opt/plexconnect/PlexConnect.py

