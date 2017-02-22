# Debian package for [ttcopy](https://github.com/greymd/ttcopy)

## Manual build

```
# Build
$ cd ttcopy-2.2.0-1
$ debuild -us -uc --lintian-opts --profile debian

# Upload to Launchpad
$ cd ..
$ debsign -k <Secret Key> ttcopy_2.2.0-1_amd64.changes
$ dput ppa:greymd/ttcopy ttcopy_2.2.0-1_amd64.changes

# Install
$ dpkg -i ttcopy-2.2.0-1.deb
```

## With APT

```
TBD
```
