#!/bin/sh

set -o errexit

GDALBLD=/home/vagrant/packages/gdal/gdal

if test "x$1" = "x" ; then
  echo "Usage: mkdeb.sh <packaging>"
  echo
  echo "ie. mkdeb.sh [-c] 3pl"
  exit 1
fi

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

exit 1

ls -l *.deb
rm -f /vagrant/debs/gdal-cmo*.deb
mv *.deb /vagrant/debs


