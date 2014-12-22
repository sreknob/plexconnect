#!/bin/bash
# Check if existing config file exist, if so will use it.
echo "*** Generate a default config file..."
  /usr/bin/python /opt/plexconnect/Settings.py                            #Create the default config in /opt/plexconnect
  echo "*** Move Settings.cfg to Settings-backup.cfg..."
  cp /opt/plexconnect/Settings.cfg /opt/plexconnect/Settings-backup.cfg   #Move the Settings to backup Settings-backup
  echo "*** Check if previous config exist, if so will use it..."
  if [ -f /config/Settings.cfg ]; then                                    #Check if config file already exist
    echo "*** Yes, it exist...using it!"
    echo "*** Creating symlink to existing config..."
    ls -s /opt/plexconnect/Settings.cfg /config/Settings.cfg              #Symlink the Settings.cfg to /config/Settings.cfg
  else
    echo "*** No, it did not exist... using the default one!"
    echo "*** Copying the default one to /config folder..."
    mv /opt/plexconnect/Settings-backup.cfg /config/Settings.cfg          #If config did not exist, copy default.
    echo "*** Creating symlink to new config..."
    ls -s /opt/plexconnect/Settings.cfg /config/Settings.cfg              #SymLink the Settings.cfg to /config/Settings.cfg
  fi

# Run the PlexConnect  
echo "*** Launching PlexConnect..."
exec /usr/bin/python /opt/plexconnect/PlexConnect.py

