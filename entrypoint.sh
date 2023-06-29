#!/bin/sh

cat sb-example.json > sb-config.json

if [ ! -f warp.yml ]; then
    ./WarpRegister > warp.yml
    sed -i "s#$(cat sb-config.json | grep 'local_address' | awk -F ',' '{print $2}' | awk -F '"' '{print $2}' | awk -F '/' '{print $1}')#$(cat warp.yml | grep 'v6:' | cut -d " " -f 2)#" sb-config.json
    sed -i "s#$(cat sb-config.json | grep 'private_key' | awk -F ':' '{print $2}' | awk -F '"' '{print $2}')#$(cat warp.yml | grep 'private_key:' | cut -d " " -f 2)#" sb-config.json
    sed -i "s#$(cat sb-config.json | grep 'peer_public_key' | awk -F ':' '{print $2}' | awk -F '"' '{print $2}')#$(cat warp.yml | grep 'public_key:' | cut -d " " -f 2)#" sb-config.json
    sed -i "s#$(cat sb-config.json | grep 'reserved' | awk -F '[' '{print $2}' | awk -F ']' '{print $1}')#$(cat warp.yml | grep 'reserved:' | cut -d "[" -f 2 | cut -d "]" -f 1)#" sb-config.json
fi

if [ ! -z $SOCKS_USER ] && [ ! -z $SOCKS_PASSWORD ]; then
    sed -i "s#$(cat sb-config.json | grep 'username' | awk -F ':' '{print $2}' | awk -F '"' '{print $2}')#$SOCKS_USER#" sb-config.json
    sed -i "s#$(cat sb-config.json | grep 'password' | awk -F ':' '{print $2}' | awk -F '"' '{print $2}')#$SOCKS_PASSWORD#" sb-config.json
else
    sed -i "$(awk '/username/{print NR}' sb-config.json)d" sb-config.json
    sed -i "$(awk '/password/{print NR}' sb-config.json)d" sb-config.json
fi

socat TCP-LISTEN:40000,fork TCP:localhost:40001 &
./sing-box run -c sb-config.json
