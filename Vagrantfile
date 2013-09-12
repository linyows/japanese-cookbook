# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--memory', '384']
  end

  cookbooks_path = %w(cookbooks)

  config.vm.define :centos do |centos|
    centos.vm.box = 'CentOS_6.4-Chef_11.4.4'
    centos.vm.box_url = 'http://goo.gl/GZqvsF'
    centos.vm.hostname = 'centos'
    centos.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = cookbooks_path
      chef.add_recipe 'japanese'
    end
  end

  config.vm.define :ubuntu do |ubuntu|
    ubuntu.vm.box = 'Ubuntu_12.04-Chef_11.4.4'
    ubuntu.vm.box_url = 'http://goo.gl/np92o'
    ubuntu.vm.hostname = 'ubuntu'
    ubuntu.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = cookbooks_path
      chef.add_recipe 'japanese'
    end
  end
end
