#!/bin/sh

set -o errexit

GDALBLD=$HOME/packages/gdal/gdal

if test "x$1" = "x" ; then
  echo "Usage: build.sh <packaging>"
  echo
  echo "ie. build.sh 3pl"
  exit 1
fi

PACKAGING=$1

if test `lsb_release -c | cut -f 2` != 'precise' ; then
  echo "Not running on Ubuntu precise, shouldn't you be?"
  exit 1
fi

if test ! -f $GDALBLD/.libs/libgdal.so ; then
  echo "GDAL does not appear to be built at $GDALBLD"
  exit 1
fi

cd gdal/gcp2rpc

git pull origin master

g++ \
    -I/usr/include/gdal \
    gcps2rpc.cpp \
    -o gcps2rpc \
    -lgdal -lossim

rm -rf debwrk
mkdir debwrk
mkdir -p debwrk/usr/bin
cp gcps2rpc debwrk/usr/bin

mkdir -p debwrk/DEBIAN
sed 's/@@@PACKAGING@@@/'$PACKAGING'/g' ../../control.debian > debwrk/DEBIAN/control

DEB=gcps2rpc_1.0.0-${PACKAGING}_amd64.deb
rm -f $DEB
dpkg-deb --build debwrk $DEB

ls -l *.deb
rm -f /vagrant/debs/gcps2rpc*.deb
mv *.deb /vagrant/debs


