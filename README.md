# Debian package for [ttcopy](https://github.com/greymd/ttcopy)

## Manual build
Use Debian-based Linux like Ubuntu.

```sh

# --------------------
# Preparation
# --------------------

# Fill in the ttcp version number which you want to build.
$ VERSION="X.X.X"
$ git clone --recursive https://github.com/greymd/dpkg-ttcopy.git
$ cd dpkg-ttcopy/ttcopy-template
$ dch -i
# => Increment versioning and put descriptions of the package build.
# Please refer to :Versioning section in this file.

# Fetch ttcopy which has given VERSION
$ cd ../ttcopy.git
$ git checkout $VERSION
$ cd ../

# --------------------
# Build
# --------------------

# Create directory for build.
$ cd -rL ttcopy-template ttcopy-${VERSION}
$ cd ttcopy-${VERSION}

# Dry build
$ debuild -us -uc
# => Check result.
# If there is any errors like "E:error message", please solve it.

# Build
$ debuild -S -sd
# => Enter passphrases of allowed GPG passphrase two times.
# If you want to overwrite previous version, `debuild -S -sa`

# --------------------
# Upload to Launchpad
# --------------------
$ cd ..

# For test
$ dput ppa:ttcopy/nightly ttcopy_${VERSION}*.changes

# For production
$ dput ppa:ttcopy/ppa ttcopy_${VERSION}*.changes

```

## Installation with APT

```sh
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

## Versioning
Basically, please refer to https://help.launchpad.net/Packaging/PPA/BuildingASourcePackage .
ttcopy does not require any compile, therefore suffix like `ubuntu<version num>` is not necessary.

Package version follows this rule.

```
ttcopy-<ttcopy version>-<build version>
```

`<build version>` increments if same `<ttcopy version>` is built in multiple times.
`-1` is used if there is no retried build.
