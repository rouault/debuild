debuild
=======

This contains scripts and stuff needed to build custom .deb's needed
at Planet Labs.  Also a few notes here on how debian related stuff works.



Our .deb's depend on some ubuntugis debs.  So first add the UbuntuGIS PPA:

  sudo apt-get install python-software-properties
  sudo add-apt-repository ppa:ubuntugis/ubuntugis-unstable
  sudo apt-get update

UbuntuGIS .deb's live at:

  http://ppa.launchpad.net/ubuntugis/ubuntugis-unstable/ubuntu/pool/main/

Building GDAL .deb's in a Precise VM with support debs all allready installed.

  mkdir -p ~/packages/
  mkdir -p /vagrant/debs
  cd debuild/gdal/
  ./setup.sh
  ./build.sh

The resulting .deb's are copied to /vagrant/debs
