#!/usr/bin/env bash

sudo apt-get update

# Set key
sudo apt-get install -y gnupg2
curl -sSL https://rvm.io/mpapis.asc | gpg2 --import

# Download RVM
curl -sSL get.rvm.io | bash -s stable
source /home/vagrant/.rvm/scripts/rvm
rvm reload

# Check and install RVM requirements
rvm requirements
sudo apt-get -y install gawk g++ gcc libreadline6-dev zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 autoconf libgmp-dev libgdbm-dev libncurses5-dev automake libtool bison pkg-config libffi-dev
sudo apt-get -y install libpq-dev

# Install ruby (newest of 2.3)
rvm reload
rvm get head
# rvm install 2.3.0
# rvm use 2.3.0 --default
rvm install 2.3
rvm use 2.3 --default
rvm rubygems current
