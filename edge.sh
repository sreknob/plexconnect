#!/bin/bash

# Does the user want the latest version
if [ -z "$EDGE" ]; then
  echo "Bleeding edge not requested"
else
  apt-get install -qy git
  mv /opt/plexconnect/assets/certificates/trailers* /tmp/
  rm -rf /opt/plexconnect
  git clone https://github.com/iBaa/PlexConnect.git /opt/plexconnect
  mv /tmp/trailers* /opt/plexconnect/assets/certificates/
fi

if [ -z "$GHOST" ]; then
  echo "CyberGhost84 version not requested"
else
  echo "CyberGhost84 version requested!"
  apt-get install -qy git
  mv /opt/plexconnect/assets/certificates/trailers* /tmp/
  rm -rf /opt/plexconnect
  wget https://github.com/CyberGhost84/PlexConnect/archive/master.zip
  unzip master.zip
  mv PlexConnect-master/ /opt/plexconnect
  chown nobody:users /opt/plexconnect
  mv /tmp/trailers* /opt/plexconnect/assets/certificates/
fi 

# Generate SSL certificates if they don't exist
if [ -f /opt/plexconnect/assets/certificates/trailers.pem ] ; then
  echo "SSL certs exist"
else
  openssl req -new -nodes -newkey rsa:2048 -out /opt/plexconnect/assets/certificates/trailers.pem -keyout /opt/plexconnect/assets/certificates/trailers.key -x509 -days 7300 -subj "/C=US/CN=trailers.apple.com"
  openssl x509 -in /opt/plexconnect/assets/certificates/trailers.pem -outform der -out /opt/plexconnect/assets/certificates/trailers.cer && cat /opt/plexconnect/assets/certificates/trailers.key >> /opt/plexconnect/assets/certificates/trailers.pem
fi
