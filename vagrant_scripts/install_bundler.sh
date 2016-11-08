#!/usr/bin/env bash

echo "gem: --no-ri --no-rdoc" > ~/.gemrc
gem install bundler
rbenv rehash
