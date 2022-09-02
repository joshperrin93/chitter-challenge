source 'https://rubygems.org'

ruby '3.0.2'

group :test do
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end

group :development, :test do
  gem 'rubocop', '1.20'
end

gem "pg", "~> 1.4"
gem 'sinatra'
gem "sinatra-contrib", "~> 2.2"
gem 'thin'
gem 'require_all'
gem 'activerecord', '5.2'
gem 'sinatra-activerecord'
gem "rack-test", "~> 1.1"
gem 'rake'
gem "webrick", "~> 1.7"
gem "rack-test", "~> 1.1"

group :development do
  gem 'shotgun'
  gem 'pry'
  gem 'tux'
  gem 'sqlite3', '~> 1.3.6'
end
