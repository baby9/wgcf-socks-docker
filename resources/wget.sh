#!/bin/sh

case $TARGETARCH in
"arm")
    Reg_arch="WarpRegister-linux-arm"
    Sing_arch="sing-box-1.3.0-linux-armv7"
    ;;
"arm64")
    Reg_arch="WarpRegister-linux-arm64"
    Sing_arch="sing-box-1.3.0-linux-arm64"
    ;;
"amd64")
    Reg_arch="WarpRegister-linux-amd64"
    Sing_arch="sing-box-1.3.0-linux-amd64"
    ;;
*)
    exit 1
    ;;
esac

wget "https://github.com/baby9/wgcf-socks-docker/releases/download/v1.0/$Reg_arch" -O WarpRegister
wget "https://github.com/SagerNet/sing-box/releases/download/v1.3.0/${Sing_arch}.tar.gz"
tar xvf "${Sing_arch}.tar.gz"
mv "${Sing_arch}/sing-box" .
rm -rf sing-box-*
