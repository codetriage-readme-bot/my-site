source 'https://rubygems.org'

ruby '2.2.3'

gem 'rails', '4.2.5'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
# gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'jbuilder'
gem 'sdoc', group: :doc  # bundle exec rake doc:rails generates the API under doc/api.

# gem 'bcrypt', '~> 3.1.7'      # Use ActiveModel has_secure_password
# gem 'unicorn'                 # Use Unicorn as the app server
# gem 'capistrano-rails', group: :development     # Use Capistrano for deployment

gem 'nokogiri'

group :development, :test do
  gem 'byebug'                  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'capybara'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'webrat'
end

group :test do
  gem 'shoulda'
  gem 'shoulda-matchers'
  gem 'zeus'
end

group :development do
  gem 'web-console', '~> 2.0'   # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'seed_dumper'
end

group :production do
  gem 'rails_12factor'
  gem 'puma'
end

gem 'pg'


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]


# Due to develop:
gem 'bower-rails'
# gem 'devise'  # For remember to install
gem 'bootstrap-sass', '~> 3.3.6'
#gem 'bundler', '1.10.6'
