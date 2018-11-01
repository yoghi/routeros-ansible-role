#!/bin/bash

# config ssh
echo "Host 127.0.0.1" > ~/.ssh/config
echo "\tStrictHostKeyChecking no" >> ~/.ssh/config
echo "\tUserKnownHostsFile=/dev/null" >> ~/.ssh/config

if [[ $TRAVIS_OS_NAME == 'osx' ]]; then
    brew update
    brew install qemu
    brew install wput
fi

if [[ $TRAVIS_OS_NAME == 'linux' ]]; then
    sudo apt-get update
    sudo apt-get install expect qemu-system wput
fi
