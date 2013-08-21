#!/bin/sh

set -o errexit

FLAGS="-b -j5"
if test "$1" != "-c" ; then
  FLAGS="$FLAGS -nc"
else
  shift 1
fi

cd $HOME/packages/gdal/gdal

rm -f build-stamp

echo 
echo dpkg-buildpackage $FLAGS
echo

dpkg-buildpackage $FLAGS


