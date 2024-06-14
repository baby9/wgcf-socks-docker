#!/bin/sh

set -e

case $TARGETARCH in
"arm")
    Sing_arch="sing-box-1.7.0-linux-armv7"
    ;;
"arm64")
    Sing_arch="sing-box-1.7.0-linux-arm64"
    ;;
"386")
    Sing_arch="sing-box-1.7.0-linux-386"
    ;;
"amd64")
    Sing_arch="sing-box-1.7.0-linux-amd64"
    ;;
"s390x")
    Sing_arch="sing-box-1.7.0-linux-s390x"
    ;;
*)
    echo "error: architecture not supported"
    exit 1
    ;;
esac

wget "https://github.com/SagerNet/sing-box/releases/download/v1.7.0/${Sing_arch}.tar.gz"
tar xvf "${Sing_arch}.tar.gz"
mv "${Sing_arch}/sing-box" .
rm -rf sing-box-*
