#!/usr/bin/env bash

# Prepare DB
bundle exec rake db:create
bundle exec rake db:migrate

# Prepare tests
bundle exec rake db:test:prepare
bundle exec rake db:seed
