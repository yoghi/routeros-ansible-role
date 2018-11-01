# routeros-ansible-role [![Build Status](https://travis-ci.com/yoghi/routeros-ansible-role.svg?branch=master)](https://travis-ci.com/yoghi/routeros-ansible-role) [![Ansible Galaxy](https://img.shields.io/badge/routeros_ansible_role-latest-blue.svg)](https://galaxy.ansible.com/yoghi/routeros_ansible_role)
Ansible role configure basic mikrotik routeros device

## Dependencies

- librouteros

## Variables

Remember configure router os variable and install librouteros

* `routeros_secure_address`: trusted network for winbox connect Es: "10.0.0.0/24" 

* `routeros_ssh_port`: ssh open port Es: 3322

* `routeros_disable_password_login`: disable login with passowd [True/False]

* `routeros_disable_old_cryptographic_login`: disable dsa and other old cryptographic alghoritm [True/False]

* `routeros_timezone`: timezone  Es: Europe/Rome

### Author Information

* Stefano Tamagnini


### Feedback, bug-reports, requests, ...

Are [welcome](https://github.com/yoghi/routeros-ansible-role/issues)!
