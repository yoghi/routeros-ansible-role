#!/bin/bash
ansible-playbook -i inventory.secure routeros.yml --tags shutdown -vvv