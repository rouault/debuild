#!/bin/sh

set -o errexit

DEBUILD_TREE=`pwd`
UPSTREAM_TARBALL=http://images.notprod.pl/grass-7.0.svn_src_snapshot_2012_02_04.tar.gz

TARBALL=`basename $UPSTREAM_TARBALL`
if test ! -f $TARBALL ; then
  curl $UPSTREAM_TARBALL -o $TARBALL
fi

if test ! -d grass ; then
  tar xf $DEBUILD_TREE/$TARBALL
  mv `basename $TARBALL .tar.gz` grass

  # This avoids linking against a full library path making things non-movable
  patch -p0 < patches/VECTORDEPS.patch
fi

sudo apt-get install \
    autoconf2.13 flex bison graphviz libcairo2-dev \
    libfftw3-dev libglu1-mesa-dev libtiff-dev libncurses5-dev \
    libxmu-dev python-wxgtk2.8 libwxgtk2.8-dev tcl-dev tk-dev

sudo apt-get install -y --force-yes \
    proj-bin libproj-dev libgdal1-dev libgeotiff-dev \
    fftw-dev libfreetype6-dev python-dateutil python-gdal gdal-bin
