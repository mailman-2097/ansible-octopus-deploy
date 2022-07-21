#! /bin/bash -e
cp /etc/apt/sources.list /etc/apt/sources.list.0
sed -i -E "s|http://us.|http://|g" /etc/apt/sources.list
apt-get update -y
apt-get upgrade -y
apt-get install software-properties-common
add-apt-repository --yes --update ppa:ansible/ansible
apt-get install ansible -y
ansible-galaxy collection install community.general
pushd /vagrant
ansible-playbook provisioning/ansible/playbook.yml
popd