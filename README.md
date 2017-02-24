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
$ git checkout "v$VERSION"
$ cd ../

# --------------------
# Build
# --------------------

# Create directory for build.
$ cp -rL ttcopy-template ttcopy-${VERSION}
$ cd ttcopy-${VERSION}

# Dry build
$ debuild -us -uc
# => Check result.
# If there is any errors like "E:error message", please solve it.

# Build
$ debuild -S -sd
# => Enter passphrases of allowed GPG passphrase two times.
# If you want to overwrite previous version, `debuild -S -sa`

$ cd ..

# --------------------
# Install on local (Optional)
# --------------------
$ dpkg -i ttcopy_${VERSION}*.deb

# --------------------
# Upload to Launchpad
# --------------------

# For test
$ dput ppa:ttcopy/nightly ttcopy_${VERSION}*_source.changes

# For production
$ dput ppa:ttcopy/ppa ttcopy_${VERSION}*_source.changes

# --------------------
# Git
# --------------------
# change .tar.gz to .orig.tar.gz
$ echo ttcopy_${VERSION}*.tar.gz | perl -nle '$dot_orig = $_; $dot_orig =~ s/\.tar/.orig.tar/; print "mv $_ $dot_orig"' | sh

# Add orig.tar.gz file to the repository.
$ git add *.orig.tar.gz ttcopy-template
# => After that, git-commit and git-push

# --------------------
# Cleaning
# --------------------
# Delete all the untracked files.
$ git ls-files --others --directory | xargs rm -rf

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
