# Debian package for [ttcopy](https://github.com/greymd/ttcopy)

## Manual build
Use Debian-based Linux like Ubuntu.

```
$ VERSION="X.X.X" # Fill in the ttcp version number which you want to build.
$ git clone --recursive https://github.com/greymd/dpkg-ttcopy.git
$ cd dpkg-ttcopy/ttcopy-template
$ dch -i
# => Increment versioning and put descriptions of the package build.

# Fetch ttcopy which has given VERSION
$ cd ../ttcopy.git
$ git checkout $VERSION
$ cd ../

# Build
$ cd -rL ttcopy-template ttcopy-${VERSION}
$ cd ttcopy-${VERSION}

$ debuild -us -uc
# => Check result

$ debuild -S -sd # If you want to overwrite previous version, `debuild -S -sa`
# => Enter passphrases of allowed GPG passphrase two times.

# Upload to Launchpad
$ cd ..

# For test
$ dput ppa:ttcopy/nightly ttcopy_${VERSION}*.changes

# For production
$ dput ppa:ttcopy/ppa ttcopy_${VERSION}*.changes
```

## Installation with APT

```
$ sudo apt-get -y install software-properties-common # if necessary

# For test
$ sudo add-apt-repository ppa:ttcopy/nightly

# For production
$ sudo add-apt-repository ppa:ttcopy/ppa

$ sudo apt update
$ sudo apt install ttcopy

# Uninstall
$ sudo apt remove ttcopy
```

