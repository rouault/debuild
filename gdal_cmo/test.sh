#!/bin/sh

sudo dpkg -r gdal-cmo
sudo dpkg -i ../../debs/gdal-cmo*.deb

#gdalinfo @driver=cmo,file=test1.tif

python gdal/driver/driver_tests.py

