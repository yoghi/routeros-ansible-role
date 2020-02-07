#!/bin/bash

# config ssh
echo "Host *" > ~/.ssh/config
echo "  StrictHostKeyChecking no" >> ~/.ssh/config
echo "  UserKnownHostsFile=/dev/null" >> ~/.ssh/config
echo "" >> ~/.ssh/config

if [[ $TRAVIS_OS_NAME == 'osx' ]]; then
    brew update
    brew install qemu
    brew install wput
fi

if [[ $TRAVIS_OS_NAME == 'linux' ]]; then
    sudo apt-get update -qq
    sudo apt-get install expect qemu-system qemu-utils -qq
fi
