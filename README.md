# Debian package for [ttcopy](https://github.com/greymd/ttcopy)

## Manual build

```
# Build
$ cd ttcopy-<VERSION>

$ debuild -us -uc
# => Check result

$ debuild -S -sa
# => Enter passphrases two times.

# Upload to Launchpad
$ cd ..
$ dput ppa:ttcopy/ppa ttcopy-<VERSION>.changes
```

## With APT

```
$ sudo apt-get -y install software-properties-common # if necessary
$ sudo add-apt-repository ppa:ttcopy/ppa
$ sudo apt update
$ sudo apt install ttcopy
```
