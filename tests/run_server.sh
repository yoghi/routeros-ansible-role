#!/bin/bash

cd ${0%/*}

# Establish working directory
mkdir -p temp/
cd temp/

if [[ -z "${ROUTEROS_VERSION}" ]]; then
    VERSION="6.43.4"
else
    VERSION="${ROUTEROS_VERSION}"
fi

echo "Use routeros $VERSION"

# Bash script to exit when any command (including non-simple commands) fail
set -euo pipefail

# Make sure Mikrotik CHR is downloaded
if [ ! -e chr.vdi ]; then
	wget -O chr.vdi https://download2.mikrotik.com/routeros/$VERSION/chr-$VERSION.vdi
fi

# Create snapshot image for testing
if [ -f chr.qcow2 ]; then rm chr.qcow2; fi
qemu-img create -f qcow2 -b chr.vdi chr.qcow2

# qemu-system-x86

# Start RouterOS
qemu-system-x86_64 -hda chr.qcow2 -nographic -device e1000,netdev=net0 \
    -netdev user,id=net0,net=192.168.254.0/24,dhcpstart=192.168.254.10,hostfwd=tcp:127.0.0.1:8728-:8728,hostfwd=tcp:127.0.0.1:22122-:22,hostfwd=tcp:127.0.0.1:23222-:3322,hostfwd=tcp:127.0.0.1:22121-:21,hostfwd=tcp:127.0.0.1:22291-:8291 > /dev/null &

sleep 30

QEMU_PID=$!
# cleanup() {
# 	kill $QEMU_PID
# }
# trap cleanup EXIT

# Wait for it to become available
echo Waiting for RouterOS to boot...
python -c "import librouteros
while True:
    try: librouteros.connect('127.0.0.1','admin','')
    except (ConnectionRefusedError): 
        print('skip connect' + '\n')
        continue
    else: 
        break
"
echo ...DONE

cd ..

# developer private key
yes y | ssh-keygen -t rsa -b 2048 -N "" -f ./temp/developer.key -m PEM || true

# https://www.tcl.tk/man/expect5.31/expect.1.html
/usr/bin/expect preconf.tcl 22122

# chiave pubblica stub
wput -v -p ./temp/developer.key.pub ftp://admin+cet:@localhost:22121/developer.key.pub -t 0 -q || true

key=$(cat ./temp/developer.key.pub)

/usr/bin/expect security.tcl 22122 "$key"
