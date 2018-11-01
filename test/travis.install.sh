#!/bin/bash

if [[ $TRAVIS_OS_NAME == 'osx' ]]; then
    brew update
    brew install qemu
fi

if [[ $TRAVIS_OS_NAME == 'linux' ]]; then
    sudo apt install expect qemu-system
fi
