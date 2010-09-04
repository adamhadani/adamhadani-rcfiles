#!/bin/bash
#
# adamhadani's Ubuntu dev machine setup bootstrap script
#
# Tested on an Ubuntu 9.10 & 10.04 Server LTS installations.
#
# Author: Adam Ever-Hadani <search@videosurf.com>
# URL:    http://github.com/adamhadani/adamhadani-rcfiles
#
# Last Changes:
#  09/03/10 - Initial version commited.
#
#
#
###############################################################################

log() {
    echo "$*"
}
error() {
    printf "ERROR: $*\n" >&2
    exit 1
}

###############################################################################

release_codename=`lsb_release -sc`

# Update machine os/packages
apt-get update &&
apt-get upgrade

# Install some commonly used system tools / packages
apt-get --quiet --yes install vim man tree rsync \
        htop lshw sysstat ntp unrar \
				screen revelation \
   			libpq-dev postgresql-client \
        iproute traceroute libevent-dev \
        supervisor

# Source control - SVN / Git
apt-get --quiet --yes install subversion git-core

# Web development environment - Apache / PHP etc.
apt-get --quiet --yes install apache2 php5 php5-cli

# Setup Java (Sun JVM)
if [ "$release_codename" = "lucid" ];
then
    # For Ubuntu 10.04, Need to enable partner repository
    # for Sun Java to be available.
    log "* Enabling partner repository for Sun JVM on Ubuntu 10.04"
    apt-get --quiet --yes install python-software-properties &&
    add-apt-repository "deb http://archive.canonical.com/ lucid partner" &&
    apt-get update
fi

apt-get --quiet --yes install sun-java6-jdk &&
update-java-alternatives -s java-6-sun

# Setup Eclipse IDE
apt-get --quiet --yes --no-install-recommends install eclipse

# Setup various python packages and their dependencies
apt-get --quiet --yes ipython python-setuptools python-virtualenv \
				python-numpy python-scipy python-matplotlib

# Configure sudoers, allow admin group
perl -pi -e 's|#\s*%admin|%admin|' /etc/sudoers

# Default base directory for development projects/checkouts
mkdir ~/Development

# Refresh filesys, cleanup etc
updatedb

log "All done."

