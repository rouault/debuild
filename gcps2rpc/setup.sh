#!/bin/sh

set -o errexit

sudo apt-get -y install libossim-dev libossim1 libopenthreads-dev

if test ! -d gdal ; then
  git clone git@github.com:planetlabs/gdal.git 
fi
