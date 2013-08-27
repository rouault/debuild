#!/bin/sh

for test_dir in /vagrant/debs ../debs $HOME/debuild/debs ; do
  if [ -d $test_dir ] ; then
    # change this to use rsync eventually.
    echo rsync .deb files...
    rsync -vt $test_dir/*.deb ubuntu@apt.notprod.pl:www/binary/precise

    echo "refresh catalog"
    ssh ubuntu@apt.notprod.pl ./refresh.sh
    exit 0
  fi
done

echo Unable to find "debs" directory to upload, nothing done.
