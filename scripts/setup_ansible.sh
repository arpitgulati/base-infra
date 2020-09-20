#!/usr/bin/env bash
sudo apt-get update
sudo apt-get -y install libffi-dev python3-pip libssl-dev python-dev
sudo pip3 install ansible==2.2.1.0 cryptography