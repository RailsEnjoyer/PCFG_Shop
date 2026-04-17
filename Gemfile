# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'bcrypt', '3.1.18'
gem 'erb_lint', '0.3.1'
gem 'importmap-rails', '2.2.3'
gem 'jbuilder', '2.14.1'
gem 'jquery-rails', '4.5.1'
gem 'pg', '~> 1.5'
gem 'puma', '>= 5.0'
gem 'rails', '~> 8.0.3'
gem 'sass-rails', '6.0.0'
gem 'sprockets-rails', '3.4.2'
gem 'stimulus-rails', '1.3.4'
gem 'turbo-rails', '2.0.23'

gem 'mini_magick', '4.12.0'

gem 'bootsnap', '1.16.0', require: false
gem 'tzinfo-data', '~> 1.2024', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'debug', '1.7.1', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'rubocop', '1.86.1', require: false
  gem 'rubocop-factory_bot', '2.28.0', require: false
  gem 'rubocop-rspec', '3.9.0', require: false
  gem 'rubocop-rspec_rails', '2.32.0', require: false
  gem 'web-console', '4.3.0'
end

group :test do
  gem 'capybara', '3.38.0'
  gem 'selenium-webdriver', '4.8.2'
  gem 'webdrivers', '5.2.0'
end
