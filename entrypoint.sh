#!/bin/sh

if [ ! -f warp.yml ]; then
    ./WarpRegister > warp.yml
fi

if [ ! -f sb-config.json ]; then
    cat sb-example.json > sb-config.json
    sed -i "s#$(cat sb-config.json | grep 'local_address' | awk -F ',' '{print $2}' | awk -F '"' '{print $2}' | awk -F '/' '{print $1}')#$(cat warp.yml | grep 'v6:' | cut -d " " -f 2)#" sb-config.json
    sed -i "s#$(cat sb-config.json | grep 'private_key' | awk -F ':' '{print $2}' | awk -F '"' '{print $2}')#$(cat warp.yml | grep 'private_key:' | cut -d " " -f 2)#" sb-config.json
    sed -i "s#$(cat sb-config.json | grep 'peer_public_key' | awk -F ':' '{print $2}' | awk -F '"' '{print $2}')#$(cat warp.yml | grep 'public_key:' | cut -d " " -f 2)#" sb-config.json
    sed -i "s#$(cat sb-config.json | grep 'reserved' | awk -F '[' '{print $2}' | awk -F ']' '{print $1}')#$(cat warp.yml | grep 'reserved:' | cut -d "[" -f 2 | cut -d "]" -f 1)#" sb-config.json
fi

./sing-box run -c sb-config.json
