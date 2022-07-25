# -*- mode: ruby -*-
# vi: set ft=ruby :

IP_SRVR = "192.168.76.76"

VAGRANTFILE_API_VERSION = "2"
BOX_IMAGE = "geerlingguy/ubuntu2004"
SRVR_COND = true

$dns_script = <<SCRIPT
echo "$1	ubuntudocker.local	 ubuntudocker" >> /etc/hosts 
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

config.vm.define "ubuntudocker", autostart: SRVR_COND	do |ubuntudocker|
		ubuntudocker.vm.box = BOX_IMAGE
		ubuntudocker.vm.hostname = 'ubuntudocker.local'
		ubuntudocker.vm.network :private_network, ip: IP_SRVR
		ubuntudocker.vm.network :forwarded_port, guest: 22, host: 10022, id: "ssh"
    	ubuntudocker.vm.synced_folder ".", "/vagrant", owner: "vagrant", group: "vagrant"
		ubuntudocker.vm.provision "shell" do |s|
			s.inline = $dns_script
			s.args = [IP_SRVR]
		end
		ubuntudocker.vm.provision "shell", path: "script/setup.sh"

		ubuntudocker.vm.provider :virtualbox do |vb|
					vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
					vb.customize ["modifyvm", :id, "--memory", 8097]
					vb.customize ["modifyvm", :id, "--name", "ubuntudocker"]
					vb.customize ["modifyvm", :id, "--cpus", "1"]
		end
end
end
