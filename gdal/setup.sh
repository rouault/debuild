#!/bin/sh

DEBUILD_TREE=`pwd`

sudo apt-get install -y --force-yes \
    python-all-dev doxygen debhelper libpoppler-private-dev \
    liblzma-dev libopenjpeg-dev libarmadillo-dev libfreexl-dev \
    libkml-dev liburiparser-dev netcdf-bin swig chrpath \
    libproj-dev libepsilon-dev d-shlibs

mkdir -p $HOME/packages/gdal
cd $HOME/packages
if test ! -d gdal ; then
  mkdir gdal
fi
cd gdal
if test ! -d gdal ; then
  svn checkout http://svn.osgeo.org/gdal/trunk/gdal
  cd gdal
  ln -s $DEBUILD_TREE/debian
fi

