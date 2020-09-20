#!/usr/bin/env bash

#Usage ./scripts/build.sh pre_production

ami_prefix="fynd-base-"
current_tag="$(git describe --tags)"
ami_name=$ami_prefix$current_tag
packer validate -var-file=./packer/$1.json -var-file=./packer/base.json \
-var 'ami_name'=$ami_name -var 'ami_version'=$current_tag -var 'vault_password_file'='./vault_pass.txt' ./packer/packer.json
packer build -var-file=./packer/$1.json -var-file=./packer/base.json \
-var 'ami_name'=$ami_name -var 'ami_version'=$current_tag -var 'vault_password_file'='./vault_pass.txt' ./packer/packer.json