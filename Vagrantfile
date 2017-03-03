#  File: Vagrantfile
#
#  Use: Puppet Technical Challenge
#
#  Description: Single box with VirtualBox provider using
#  Puppet Provision for Jenkins
#
#  Note: Uses the pre-installed puppetlabs 16.04 Ubuntu LTS
#
#  Command: vagrant init puppetlabs/ubuntu-16.04-64-puppet
#
# -*- mode: ruby -*-
# vi: set ft=ruby 
#

Vagrant.configure("2") do |config|
  config.vm.box = "puppetlabs/ubuntu-16.04-64-puppet"
  config.vm.network "forwarded_port", guest: 8000, host: 8000
  config.vm.network "private_network", ip: "172.16.100.10"
  
  config.vm.provider "virtualbox" do |vb
     vb.memory = "1024"
  end


  config.vm.provision :puppet do |puppet|
	  puppet.environment = "production"
	  puppet.environment_path = "../../"
	  puppet.manifests_path = "puppet/manifests"
	  puppet.manifest_file = "site.pp"
	  puppet.module_path = "puppet/modules"
  end
end

