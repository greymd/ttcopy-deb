#!/bin/bash

THIS_DIR=$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%N}}")"; pwd)
printf "VERSION (i.e 1.2.3): "
read VERSION

printf "BUILD_VERSION (i.e 1): "
read BUILD_VERSION

printf "EDITOR (i.e Green Gregson <green@example.com>): "
read EDITOR

printf "GPG password: "
read PASSWORD

TMPDIR=${THIS_DIR}/tmp
mkdir -p $TMPDIR
EDIT_DATE=$(date --rfc-2822)
echo $TMPDIR

cd "$THIS_DIR"
while read DISTRO_VERSION DISTRO_CODENAME ; do
    cat $THIS_DIR/changelog.template \
        | sed "s/###VERSION###/$VERSION/g" \
        | sed "s/###BUILD_VERSION###/$BUILD_VERSION/g" \
        | sed "s/###DISTRO_VERSION###/$DISTRO_VERSION/g" \
        | sed "s/###DISTRO_CODENAME###/$DISTRO_CODENAME/g" \
        | sed "s/###EDITOR###/$EDITOR/g" \
        | sed "s/###EDIT_DATE###/$EDIT_DATE/g" > $TMPDIR/changelog.append

    cd $THIS_DIR/../
    cat $TMPDIR/changelog.append ttcopy-template/debian/changelog > $TMPDIR/changelog.new
    echo "Following log will be added."
    echo "-----------------------------"
    cat $TMPDIR/changelog.new
    echo "-----------------------------"
    printf "Is it ok? [ENTER]: "
    read ok
    exit 0

    mv $TMPDIR/changelog.new ttcopy-template/debian/changelog

    cp -rL ttcopy-template ttcopy-${VERSION}
    cd ttcopy-${VERSION}
    yes | debuild -us -uc
    printf "y\n$PASSWORD\n$PASSWORD\n" | debuild -S -sd

    cd "$THIS_DIR"
done < $THIS_DIR/support-versions

