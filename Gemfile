source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.0.3'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

gem 'acts_as_votable', '~> 0.10.0'
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'devise'
gem 'haml', '~> 5.0', '>= 5.0.1'
gem 'masonry-rails', '~> 0.2.4'
gem 'paperclip', '~> 4.3', '>= 4.3.6'
gem 'rails-controller-testing'
gem 'redcarpet'
gem 'rubocop', '~> 0.49.1', require: false
gem 'sentry-raven'
gem 'simple_form', '~> 3.5'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'sqlite3'

  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'spring'
  gem 'spring-commands-rspec'
end

gem 'web-console', group: :development

group :test do
  gem 'capybara'
  gem 'codacy-coverage', require: false
  gem 'codeclimate-test-reporter', '~> 1.0.0'
  gem 'database_cleaner'
  gem 'shoulda-matchers', github: 'thoughtbot/shoulda-matchers', branch: 'rails-5'
  gem 'simplecov', require: false
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
