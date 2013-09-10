#!/bin/sh

set -o errexit

sudo apt-get install libgeotiff-dev

if test ! -d MrSID-Raster-8.5.0 ; then
  tar xjf MrSID-Raster-8.5.0.tar.bz2 
fi
if test ! -d mrsid ; then
  svn checkout http://svn.osgeo.org/gdal/trunk/gdal/frmts/mrsid
fi
