#!/usr/bin/env python

import os
import sys

grass_script = open('debwrk/usr/bin/grass70').read()
grass_script = grass_script.replace('/home/ubuntu/debuild/grass/debwrk','')
open('debwrk/usr/bin/grass70','w').write(grass_script)


