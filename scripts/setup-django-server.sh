#!/bin/bash
#
# Quickly set up a django webapp node.
#
# Assumes OS is Ubuntu 12.04 (but checks anyway)
#

# Exit on error
set -e

# Check OS
os=`lsb_release -a`

# Make sure we're up to date
apt-get --quiet --yes update
apt-get --quiet --yes upgrade

# Basic server utilities we want to have for config / monitoring / diagnostics
apt-get --quiet --yes install vim sudo bc htop iftop lshw sysstat ntp iproute traceroute


# CVS Bindings
apt-get --quiet --yes install git-core

apt-get --quiet --yes install python-virtualenv python-pip python-django

# Apache environment
apt-get --quiet --yes install apache2 libapache2-mod-wsgi

# Default directories we work with
mkdir /srv/www

# User / Group defaults
addgroup admin

