# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64" # "express42/ubuntu-16.04"  # "ubuntu/xenial64"
  config.vm.box_check_update = false

  # for app
  # config.vm.network "forwarded_port", guest: 3000, host: 3000
  # start app with nginx
  config.vm.network "forwarded_port", guest: 80, host: 8080
  # for PostgreSQL
  # config.vm.network "forwarded_port", guest: 5432, host: 5432

  # config.vm.network "private_network", ip: "192.168.33.10"
  # config.vm.network "public_network"

  config.vm.synced_folder ".", "/vagrant"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    # vb.gui = false
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

  # Before running chef solo
  config.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update
  SHELL

  # Using the Vagrant plugin vagrant-omnibus to specify chef version.
  config.omnibus.chef_version = '12.10.24'

  # Use Chef Solo to provision our virtual machine
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"

    chef.add_recipe 'apt'

    # Include other utilities
    chef.add_recipe 'git'
    chef.add_recipe 'nodejs'
    chef.add_recipe 'ruby_build'
    chef.add_recipe 'vim'

    # RVM for rubies management
    # TODO: work by script now
    # chef.add_recipe 'rvm::vagrant'
    # chef.add_recipe 'rvm::user'

    # Postgresql
    chef.add_recipe 'postgresql::server'

  	# Install Ruby 2.3.0 and Bundler
    # TODO: for now install ruby and postgres by chef doesn't work
    chef.json = {
  	#   rvm: {
    #    user_installs: [{
    #      user: 'vagrant',
    #      rubies: ["2.3.0"],
    #      global: "2.3.0",
    #      gems: {
    #        "2.3.0" => [
    #          { name: "bundler" }
    #        ]
    #      }
    #    }]
    #   },
  	  postgresql: {
        password: {
          postgres: ""
        },
  		  version: "9.4"
      }
  	}

    chef.log_level = :debug
  end

  # After running chef solo
  # TODO: for now all below do manually
  #####################################
  # # Install RVM and ruby (manually)
  # config.vm.provision "shell", path: "vagrant_scripts/install_rvm_and_ruby.sh"
  # # Setup app
  # config.vm.provision "shell", path: "vagrant_scripts/setup_app.sh"
  # # Setup postgres
  # config.vm.provision "shell", path: "vagrant_scripts/setup_postgres.sh"
  # # Install nginx
  # config.vm.provision "shell", path: "vagrant_scripts/install_nginx.sh"
  # # Prepare DB
  # config.vm.provision "shell", path: "vagrant_scripts/prepare_db.sh"
  #####################################

  # TODO: run app - unicorn needed
end
