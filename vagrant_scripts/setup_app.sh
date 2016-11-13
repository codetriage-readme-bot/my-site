#!/usr/bin/env bash

#  Problem: Could not find bundler (>= 0) amongs [bundler-un....]
#
# You need to install bundler. Here are some words from RVM official website:
#     Starting with 1.11.0 new RVM installations has bundler enabled by default, you can still install it.
#
# Try installing rubygems-bunder with:
# gem install rubygems-bundler
#
# Now, to make all the executables bundler compatible, run:
# gem regenerate_binstubs
#
# Maybe install gem without sudo 

# Install bundler
echo "gem: --no-ri --no-rdoc" > ~/.gemrc
# sudo gem install bundler
gem install bundler

# Install all needed gems
cd /vagrant
bundle install
