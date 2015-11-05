---
# This file will be used to build the Ansible box from base Ubuntu ubuntu/trusty64 box (vagrant init ubuntu/trusty64 & vagrant up)...

# apt-get install software-properties-common
# apt-add-repository ppa:ansible/ansible
# apt-get update
# apt-get install ansible
# sudo apt-get install tree
# sudo apt-get install expect
# apt-get install git
# wget https://bootstrap.pypa.io/get-pip.py
# sudo python get-pip.py
# ansible-galaxy install cumulus.CumulusLinux
# git clone https://github.com/mirzawaqasahmed/vagrant-cumulus-ansible.git

###Once above packages are installed we need to built a box from it using vagrant command line.
###vagrant package --base [Name of a VM in virtualbox to package as a base box using "VBoxManage list vms"] --output ansible-1.9.4-w_cumulus.box
###vagrant box add --name ansible-1.9.4-w_cumulus ansible-1.9.4-w_cumulus.box