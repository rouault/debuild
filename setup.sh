#!/bin/sh

if test \! -d $HOME/debs ; then
  mkdir $HOME/debs
fi
if test \! -e /vagrant ; then
  sudo ln -s /home/ubuntu /vagrant
fi

sudo apt-get install \
    subversion python-pip emacs

sudo pip install requests
