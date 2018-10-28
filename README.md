# routeros-ansible-role
Ansible role configure basic mikrotik router os device

## workaround bug connessione
Ansible 2.7.0 presenta un bug bisogna installarsi a mano il file 
https://github.com/ansible/ansible/blob/devel/lib/ansible/module_utils/network/routeros/routeros.py
al posto di quello installato con la distribuzione standard.
@see: https://github.com/ansible/ansible/pull/41155

