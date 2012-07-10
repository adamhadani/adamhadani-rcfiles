#!/bin/bash
#
# Quickly set up a django webapp node.
#
# Assumes OS is Ubuntu 12.04 (but checks anyway)
#

# Exit on error
set -e

# Define functions used

error() {
    printf "ERROR: $*\n" >&2
    exit 1
}


# Check OS
os_distribution=`lsb_release -si`
os_release=`lsb_release -sr`

if [ "$os_distribution" -ne "Ubuntu" ];
then
    error "This script must be run on an Ubuntu linux server"
fi

# Make sure we're up to date
apt-get --quiet --yes update
apt-get --quiet --yes upgrade

# Basic server utilities we want to have for config / monitoring / diagnostics
apt-get --quiet --yes install aptitude locate vim sudo telnet bc htop iftop lshw sysstat ntp iproute traceroute

# CVS Bindings
apt-get --quiet --yes install git-core


# Apache environment
apt-get --quiet --yes install apache2 libapache2-mod-wsgi memcached

# DB Environment
apt-get --quiet --yes install postgresql libpq-dev postgis

# Python environment
apt-get --quiet --yes install python-virtualenv python-pip python-django
pip install virtualenvwrapper

# Default directories we work with
mkdir /srv/www

# User / Group defaults
addgroup admin

