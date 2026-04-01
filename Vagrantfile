# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Vagrantfile                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: iguidado <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/04/01 17:40:12 by iguidado          #+#    #+#              #
#    Updated: 2026/04/01 19:58:23 by iguidado         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

Vagrant.configure("2") do |config|
	config.vm.define "server" do |machine|
          machine.vm.network "forwarded_port", guest: 2221, host: 2221
          machine.vm.network "forwarded_port", guest: 2222, host: 2222
          machine.vm.network "forwarded_port", guest: 2223, host: 2223
	machine.vm.network "forwarded_port", id: "ssh", host: 22222, guest: 22
          machine.vm.box = 'debian/bookworm64'
          machine.vm.network "private_network", ip: '192.168.56.110'
          machine.vm.hostname = "iguidadoS"
          machine.vm.provider "virtualbox" do |vb|
          	vb.name =  "iguidadoS"
          	vb.cpus = '1'
          	vb.memory = '1024'
	  end
  machine.vm.provision "shell", inline: "apt update && apt install -y curl"
  machine.vm.provision "file", source: "./docker-compose.yml", destination: "/home/vagrant/docker-compose.yml"
  machine.vm.provision "file", source: "./webservers.yml", destination: "/home/vagrant/webservers.yml"
  machine.vm.provision "file", source: "./inventory.ini", destination: "/home/vagrant/inventory.ini"
 machine.vm.provision "file", source: "./docker.sources", destination: "/etc/apt/sources.list.d/docker.sources"
  machine.vm.provision "shell", inline: <<-SHELL
	# Add Docker's official GPG key:
	apt update
	apt install ca-certificates curl
	install -m 0755 -d /etc/apt/keyrings
	curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
	chmod a+r /etc/apt/keyrings/docker.asc

	apt update
	apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
SHELL
# machine.vm.provision "shell", inline: "kubectl apply -f Ingress.yaml"
	  end
end
