#!/bin/sh

sudo dpkg -r gdal-cmo
sudo dpkg -i ../../debs/gdal-cmo*.deb

gdalinfo CMO:test1.tif
