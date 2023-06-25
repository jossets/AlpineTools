#!/bin/sh 

echo "#########################"
echo "## Install packages"


apk --no-cache add make gcc g++ musl-dev binutils autoconf automake libtool pkgconfig check-dev file patch
apk --no-cache add openssl-dev perl

