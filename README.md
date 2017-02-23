# Debian package for [ttcopy](https://github.com/greymd/ttcopy)

## Manual build

```
# Build
$ cd ttcopy-2.2.0-1

$ debuild -us -uc --lintian-opts --profile debian
# => Check result

$ debuild -S -sa
# => Enter passphrases two times.

# Upload to Launchpad
$ cd ..
$ dput ppa:greymd/ttcopy ttcopy_2.2.0-1_amd64.changes
```

## With APT

```
$ sudo add-apt-repository ppa:greymd/ttcopy
$ sudo apt update
$ sudo apt install ttcopy
```
