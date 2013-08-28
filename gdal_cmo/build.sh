#!/bin/sh

set -o errexit

GDALBLD=/home/vagrant/packages/gdal/gdal

if test "x$1" = "x" ; then
  echo "Usage: mkdeb.sh <packaging>"
  echo
  echo "ie. mkdeb.sh 3pl"
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

cd gdal/driver
git pull origin master

make default \
    INCLUDE="-I$GDALBLD/port -I$GDALBLD/gcore -I$GDALBLD/frmts/vrt" \
    LIBS="-L$GDALBLD/.libs -lgdal"

./mkdeb.sh $1

ls -l *.deb
mv *.deb /vagrant/debs


