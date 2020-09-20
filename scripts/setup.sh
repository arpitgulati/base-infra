#!/usr/bin/env bash
environment=${1-environment}
ansible-playbook setup.yml --vault-pass vault_pass.txt --verbose --tags "fail2ban" -i ./inventory/$environment -u fynd --limit "inventory"