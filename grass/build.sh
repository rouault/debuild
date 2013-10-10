#!/bin/sh

set -o errexit

if test `lsb_release -c | cut -f 2` != 'precise' ; then
  echo "Not running on Ubuntu precise, shouldn't you be?"
  exit 1
fi

FLAGS="-b -uc -us"
if test "$1" != "-c" ; then
  FLAGS="$FLAGS -nc"
else
  shift 1
fi

ORIG_DIR=`pwd`

cd $HOME/packages/grass/grass

# Make sure we are picking up the latest and greatest.
#svn update

# Force some lightweight things to get redone even if we aren't doing a 
# clean build.
rm -f build-stamp
rm -rf debian/tmp

echo 
echo dpkg-buildpackage $FLAGS
echo

set +o errexit

dpkg-buildpackage $FLAGS

#cp ../*.deb /vagrant/debs
