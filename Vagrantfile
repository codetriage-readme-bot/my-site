# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.box_check_update = false
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 3000, host: 3000

  config.ssh.username = "vagrant"
  # config.ssh.password = ""
  # config.ssh.insert_key = "true"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  config.vm.synced_folder ".", "/vagrant"

  config.vm.provider "virtualbox" do |vb|
     # Display the VirtualBox GUI when booting the machine
    #  vb.gui = true

    # Customize the amount of memory on the VM:
    vb.memory = "1024"
  end

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", path: "vagrant_scripts/bootstrap.sh"

  # config.vm.provision "shell", path: "vagrant_scripts/install_libs.sh"
  # config.vm.provision "shell", path: "vagrant_scripts/install_ruby.sh"
  # config.vm.provision "shell", path: "vagrant_scripts/install_bundler.sh"
  # config.vm.provision "shell", path: "vagrant_scripts/install_nodejs_and_nginx.sh"
  # # config.vm.provision "shell", path: "vagrant_scripts/setup_postgres.sh"
  # # config.vm.provision "shell", path: "vagrant_scripts/setup_app.sh"
  # # config.vm.provision "shell", path: "vagrant_scripts/start_app.sh"

  # Using the Vagrant plugin vagrant-omnibus to specify chef version.
  config.omnibus.chef_version = '12.10.24'

  # Use Chef Solo to provision our virtual machine
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks"] #, "site-cookbooks"]

    chef.add_recipe 'apt'
    chef.add_recipe 'git'
    chef.add_recipe 'nodejs'
    chef.add_recipe 'ruby_build'
    chef.add_recipe 'rvm::user'
    # chef.add_recipe 'rvm::system'
    chef.add_recipe 'rvm::vagrant'
    chef.add_recipe 'vim'
    chef.add_recipe 'postgresql::server'

  	# Install Ruby 2.2.3 and Bundler
  	chef.json = {
  	  rvm: {
       user_installs: [{
         user: 'vagrant',
         rubies: ["2.2.3"],
         global: "2.2.3",
         gems: {
           "2.2.3" => [
             { name: "bundler" }
           ]
         }
       }]
      },
  	  postgresql: {
        password: {
          postgres: ""
        },
  		  version: "9.4"
      }
  	}
  end
end
