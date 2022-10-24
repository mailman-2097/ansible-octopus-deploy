# -*- mode: ruby -*-
# vi: set ft=ruby :

IP_SRVR = "192.168.76.76"
IP_N1 = "192.168.76.77"
IP_N2 = "192.168.76.78"

VAGRANTFILE_API_VERSION = "2"
BOX_IMAGE = "geerlingguy/ubuntu2004"
BOX_IMAGE_1 = "ubuntu/focal64"
SRVR_COND = true
NO_COND = false

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
					vb.customize ["modifyvm", :id, "--memory", 4096]
					vb.customize ["modifyvm", :id, "--name", "ubuntudocker"]
					vb.customize ["modifyvm", :id, "--cpus", "1"]
		end
end
config.vm.define "tentacle1", autostart: SRVR_COND	do |node|
    node.vm.box = BOX_IMAGE_1
    node.vm.hostname = 'tentacle1.local'
    node.vm.network :private_network, ip: IP_N1
    node.vm.network :forwarded_port, guest: 22, host: 10023, id: "ssh"
    node.vm.synced_folder ".", "/vagrant", owner: "vagrant", group: "vagrant"

    node.vm.provision "shell" do |s|
        s.inline = $dns_script
        s.args = [IP_SRVR, IP_N1]
    end

    node.vm.provision "shell", path: "script/setup-tentacle.sh"

    node.vm.provider :virtualbox do |vb|
                vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
                vb.customize ["modifyvm", :id, "--memory", 1024]
                vb.customize ["modifyvm", :id, "--name", "tentacle1"]
                vb.customize ["modifyvm", :id, "--cpus", "1"]
    end
end
config.vm.define "tentacle2", autostart: SRVR_COND	do |node|
    node.vm.box = BOX_IMAGE_1
    node.vm.hostname = 'tentacle2.local'
    node.vm.network :private_network, ip: IP_N2
    node.vm.network :forwarded_port, guest: 22, host: 10024, id: "ssh"
    node.vm.synced_folder ".", "/vagrant", owner: "vagrant", group: "vagrant"

    node.vm.provision "shell" do |s|
        s.inline = $dns_script
        s.args = [IP_SRVR, IP_N2]
    end

    node.vm.provision "shell", path: "script/setup-tentacle.sh"

    node.vm.provider :virtualbox do |vb|
                vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
                vb.customize ["modifyvm", :id, "--memory", 1024]
                vb.customize ["modifyvm", :id, "--name", "tentacle2"]
                vb.customize ["modifyvm", :id, "--cpus", "1"]
    end
end
end