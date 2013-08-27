#!/bin/sh

set -o errexit

if test ! -d gdal ; then
  git clone git@github.com:planetlabs/gdal.git 
fi
