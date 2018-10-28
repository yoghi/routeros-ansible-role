#!/bin/bash

if [[ $TRAVIS_OS_NAME == 'osx' ]]; then
    brew install qemu
fi

if [[ $TRAVIS_OS_NAME == 'linux' ]]; then
    apt install expect qemu-system
fi
