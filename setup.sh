#!/bin/bash

if [[ $EUID -gt 0 ]]; then
  echo "run this as root!"
  exit 1
fi

# abort install if any errors occur and enable tracing
set -o errexit
set -o xtrace

# use internal apt cache for speed
rm -f /etc/apt/apt.conf.d/90cacher
host apt-cache.cmo && echo 'Acquire::http { Proxy "http://apt-cache.cmo:3142"; }' > /etc/apt/apt.conf.d/90cacher

apt-get install -y python-software-properties software-properties-common
add-apt-repository -y ppa:ubuntugis/ubuntugis-unstable
add-apt-repository 'deb http://apt.notprod.pl/ binary/'
apt-get update

if test \! -d $HOME/debs ; then
  mkdir $HOME/debs
  chown ubuntu $HOME/debs
fi
if test \! -e /vagrant ; then
  sudo ln -s /home/ubuntu /vagrant
fi

sudo apt-get install \
    subversion python-pip emacs

sudo pip install requests

