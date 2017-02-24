#!/bin/bash

printf "VERSION (i.e 1.2.3): "
read VERSION

printf "BUILD_VERSION (i.e 1): "
read BUILD_VERSION

printf "EDITOR (i.e Green Gregson <green@example.com>): "
read EDITOR

EDIT_DATE=$(date --rfc-2822)

while read DISTRO_VERSION DISTRO_CODENAME ; do
    cat ./changelog.template \
        | sed "s/###VERSION###/$VERSION/g" \
        | sed "s/###BUILD_VERSION###/$BUILD_VERSION/g" \
        | sed "s/###DISTRO_VERSION###/$DISTRO_VERSION/g" \
        | sed "s/###DISTRO_CODENAME###/$DISTRO_CODENAME/g" \
        | sed "s/###EDITOR###/$EDITOR/g" \
        | sed "s/###EDIT_DATE###/$EDIT_DATE/g"
done < ./support-versions

