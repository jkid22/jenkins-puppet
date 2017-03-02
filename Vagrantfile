# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|
  config.vm.box = "puppetlabs/ubuntu-16.04-64-puppet"
  #  Used 1.0.1 box version to ensure manifestdir properly loads without adding additional providers
  #  https://blog.jorisvisscher.com/2016/01/09/puppet-provisioning-on-vagrant-error-manifestdir/
  config.vm.box_version="1.0.1"
  config.vm.network "forwarded_port", guest: 8000, host: 8000
  config.vm.network "private_network", ip: "172.16.100.10"
  
  config.vm.provider "virtualbox" do |vb|
     vb.memory = "1024"
  end


  config.vm.provision :puppet do |puppet|
	  puppet.manifest_path = "puppets/manifests"
	  puppet.manifest_file = "site.pp"
	  puppet.module_path = "puppets/modules"
  end
end

