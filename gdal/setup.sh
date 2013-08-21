#!/bin/sh

DEBUILD_TREE=`pwd`

mkdir -p $HOME/packages/gdal
cd $HOME/packages
if test ! -d gdal ; then
  svn checkout http://svn.osgeo.org/gdal/trunk/gdal
  cd gdal
  ln -s $DEBUILD_TREE/gdal/debian
fi
