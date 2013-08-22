#!/bin/sh

set -o errexit

FLAGS="-b -j5 -uc -us"
if test "$1" != "-c" ; then
  FLAGS="$FLAGS -nc"
else
  shift 1
fi

cd $HOME/packages/gdal/gdal

rm -f build-stamp
rm -rf debian/tmp

echo 
echo dpkg-buildpackage $FLAGS
echo

dpkg-buildpackage $FLAGS

cp ../*.deb /vagrant/debs
