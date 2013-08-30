#!/bin/sh

set -o errexit

sudo apt-get install libjson0-dev

if test ! -d gdal ; then
  git clone git@github.com:planetlabs/gdal.git 
fi
