#!/bin/bash

if [ -f ./version_list ]; then
    rm version_list
fi

curl -s "https://github.com/ethereum/go-ethereum/releases" | grep "/ethereum/go-ethereum/releases/tag/" | grep -v '\-rc' | sed 's/.*tag\/\(.*\)\">.*/\1/' >> version_list
