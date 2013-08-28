#!/usr/bin/env python

import os
import sys

checks = [
    # Sometimes zero length for some reason.
    ('debian/python-gdal/usr/share/pyshared/osgeo/osr.py', 
     1000, None),
    ('debian/python-gdal/usr/share/pyshared/osgeo/gdal.py', 
     1000, None),
    ('debian/python-gdal/usr/share/pyshared/osgeo/ogr.py', 
     1000, None),

    # Sometimes _gdal.so is around 6K instead of 100K+
    ('debian/python-gdal/usr/lib/python2.7/dist-packages/osgeo/_gdal.so', 
     50000, None),
    ('debian/python-gdal/usr/lib/python2.7/dist-packages/osgeo/_ogr.so', 
     50000, None),
    ('debian/python-gdal/usr/lib/python2.7/dist-packages/osgeo/_osr.so', 
     50000, None),
]

failures = 0
for file, minsize, maxsize in checks:
    try:
        size = len(open(file).read())
        if size < minsize:
            print '%s is %d bytes, but should be at least %d bytes.' % (
                file, size, minsize)
            failures += 1

        if maxsize is not None and size > maxsize:
            print '%s is %d bytes, but should be at most %d bytes.' % (
                file, size, maxsize)
            failures += 1

    except IOError:
        print '%s does not appear to exist!' % file
        failures += 1
    

sys.exit(failures)

