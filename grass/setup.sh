#!/bin/sh

set -o errexit

DEBUILD_TREE=`pwd`
UPSTREAM_TARBALL=http://images.notprod.pl/grass-7.0.svn_src_snapshot_2012_02_04.tar.gz

TARBALL=`basename $UPSTREAM_TARBALL`
if test ! -f $TARBALL ; then
  curl $UPSTREAM_TARBALL -o $TARBALL
fi

mkdir -p $HOME/packages/grass
cd $HOME/packages/grass

if test ! -d grass ; then
  tar xf $DEBUILD_TREE/$TARBALL
  mv grass-7.0.svn_src_snapshot_2013_08_24 grass
  cd grass
  rm -rf debian
  ln -s $DEBUILD_TREE/debian
fi

sudo apt-get install \
     autoconf2.13 flex bison graphviz libmotif-dev libcairo2-dev \
    libfftw3-dev libgdal1-dev libglu1-mesa-dev libtiff-dev libncurses5-dev \
    libxmu-dev python-wxgtk2.8 libwxgtk2.8-dev tcl-dev tk-dev \
    hardening-wrapper hardening-includes
