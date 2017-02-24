#!/bin/bash
printf "VERSION: "
read VERSION < /dev/tty
cp -rL ttcopy-template ttcopy-${VERSION}
cd ttcopy-${VERSION}
debuild -S -sd
cd ..
dput ppa:ttcopy/ppa ttcopy_${VERSION}*_source.changes
git ls-files --others --directory | xargs rm -rf
