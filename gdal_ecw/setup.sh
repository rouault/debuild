#!/bin/sh

set -o errexit

if test ! -d ecwjp2_sdk_minimal ; then
  tar xjf ecwjp2_sdk_7.0_minimal.tar.bz2 
fi
if test ! -d ecw ; then
  svn checkout http://svn.osgeo.org/gdal/trunk/gdal/frmts/ecw 
fi
