#!/bin/sh

set -o errexit

cd $HOME/packages/gdal/gdal

rm -f ../log
dpkg-buildpackage -b -j5 |& tee ../log

