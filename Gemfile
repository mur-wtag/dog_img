# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'bootsnap', require: false
gem 'httparty'
gem 'importmap-rails'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rack-attack', '~> 6.7.0'
gem 'rails', '~> 7.0.4'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'tailwindcss-rails', '~> 2.0'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'erb-formatter'
  gem 'pry', '~> 0.14.1'
  gem 'rails_best_practices'
end

group :development do
  gem 'dotenv-rails', '~> 2.5'
  gem 'pre-commit'
  gem 'rubocop', '1.39'
  gem 'web-console'
end

group :test do
  gem 'timecop'
end

group :development, :test do
  gem 'rspec-rails', '~> 6.1.0'
  gem 'vcr'
  gem 'webmock'
end
