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
$ dch
# => Increment versioning and put descriptions of the package build.
# Please refer to "Versioning" section in this file.

# Fetch ttcopy which has given VERSION
$ ( cd ../ttcopy.git; git checkout "v$VERSION" )
# => HEAD is now at XXXXXXX... Bump version to X.X.X

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
# Answer "yes" is you asked something.
# If there is any errors like "E:error message", please solve it.

# Build
$ debuild -S -sd
# => Enter passphrases of allowed GPG passphrase two times.
# If you want to overwrite previous version, `debuild -S -sa`

$ cd ..

# --------------------
# Install on local (Optional)
# --------------------

# Try installing
$ dpkg -i ttcopy_${VERSION}*.deb

# Remove
$ dpkg --remove ttcopy

# --------------------
# Upload to Launchpad
# --------------------

# For test
$ dput ppa:ttcopy/nightly ttcopy_${VERSION}*_source.changes

# For production
$ dput ppa:ttcopy/ppa ttcopy_${VERSION}*_source.changes

# --------------------
# Cleaning
# --------------------
# Delete all the untracked files.
$ git ls-files --others --directory | xargs rm -rf

# --------------------
# Git
# --------------------
$ git add ttcopy-template
# => After that, git-commit and git-push

```

## Installation with APT

```sh
$ sudo apt-get -y install software-properties-common python-software-properties # if necessary

# For test
$ sudo add-apt-repository ppa:ttcopy/nightly

# For production
$ sudo add-apt-repository ppa:ttcopy/ppa

$ sudo apt-get update
$ sudo apt-get install ttcopy

# Uninstall
$ sudo apt-get remove ttcopy
```

## Versioning
Basically, please refer to https://help.launchpad.net/Packaging/PPA/BuildingASourcePackage .
ttcopy does not require any compile, therefore suffix like `ubuntu<version num>` is not necessary. (@greymd thinks ... so, but it's not confident.)

Package version follows this rule.

```
ttcopy-<ttcopy version>-<build version>
```

For example

```
ttcopy-2.0.0-3
```

`<build version>` increments if same `<ttcopy version>` is built in multiple times.
`-0` is used if there is no retried build.

