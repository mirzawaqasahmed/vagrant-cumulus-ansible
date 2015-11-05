#!/bin/bash
ssh-keygen -t rsa -C 'SSH key for use of Ansible to connect to hosts' -N '' -f /home/vagrant/.ssh/ansible-use-ssh-key