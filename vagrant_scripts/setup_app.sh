#!/usr/bin/env bash

cd /vagrant
bundle install
rbenv rehash

bundle exec rake db:create
bundle exec rake db:migrate
