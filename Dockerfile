FROM phusion/baseimage:0.9.11
MAINTAINER pducharme <pducharme@me.com>
# FORK FROM Needo37-Plexconnect on GitHub
ENV DEBIAN_FRONTEND noninteractive

# Set correct environment variables
ENV HOME /root

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Fix a Debianism of the nobody's uid being 65534
RUN usermod -u 99 nobody
RUN usermod -g 100 nobody

RUN apt-get update -q

# Install Dependencies
RUN apt-get install -qy python python-dev python-imaging wget unzip

# Install PlexConnect (Master Branch)
RUN wget https://github.com/iBaa/PlexConnect/archive/master.zip
RUN unzip master.zip
RUN mv PlexConnect-master/ /opt/plexconnect
RUN chown nobody:users /opt/plexconnect

EXPOSE 80

# Add edge.sh to execute during container startup
RUN mkdir -p /etc/my_init.d
ADD edge.sh /etc/my_init.d/edge.sh
RUN chmod +x /etc/my_init.d/edge.sh

# Add PlexConnect to runit
RUN mkdir /etc/service/plexconnect
ADD plexconnect.sh /etc/service/plexconnect/run
RUN chmod +x /etc/service/plexconnect/run
