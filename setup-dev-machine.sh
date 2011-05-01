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
release_version=`lsb_release -sr`

# Update machine os/packages
apt-get update &&
apt-get upgrade || {
	error "Could not update system, make sure you're running with sudo."
}

# Install some commonly used system tools / packages
apt-get --quiet --yes install vim bc man tree rsync autossh \
        htop iftop lshw sysstat ntp sudo liblzo2-dev unrar \
		screen revelation \
   		libpq-dev postgresql-client libmysqlclient-dev sqlitebrowser \
        iproute traceroute libevent-dev libyaml-dev \
        supervisor imagemagick \
        libgeoip-dev geoip-bin python-dev gcc

# Source control - SVN / Git
apt-get --quiet --yes install subversion git-core

# Web development environment - Apache / PHP / MySQL5 Server / memcached
apt-get --quiet --yes install apache2 php5 php5-cli \
		php5-curl php5-sqlite php-pear phpunit \
		memcached mysql-server

# FirePHP Core library for PHP
pear channel-discover pear.firephp.org
pear install firephp/FirePHPCore 

# No dev machine is complete without VLC player :)
apt-get --quiet --yes install vlc

# Setup Java (Sun JVM)
r=`echo "$release_version >= 10.04" | bc`
if [ "$r" ];
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

# Apache Ivy - Java Dependency manager
apt-get --quiet --yes install ivy

# Tomcat 6 (After set default Java)
apt-get --quiet --yes install tomcat6
update-rc.d tomcat6 disable
/etc/init.d/tomcat6 stop

# Setup Eclipse IDE
apt-get --quiet --yes --no-install-recommends install eclipse

# Setup various python packages and their dependencies
apt-get --quiet --yes libpng-dev libfreetype6-dev gfortran
apt-get --quiet --yes ipython python-setuptools python-nose python-virtualenv \
				python-numpy python-scipy python-matplotlib \
				python-boto

# Configure sudoers, allow admin group
perl -pi -e 's|#\s*%admin|%admin|' /etc/sudoers

# Default base directory for development projects/checkouts
mkdir ~/Development

# Refresh filesys, cleanup etc
updatedb

log "All done."

