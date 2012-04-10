source 'http://rubygems.org'
source "http://gems.github.com"
gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem "thin"
gem "mysql2"
gem "redcarpet"
gem "coderay"
gem "whenever", :require => false
gem "will_paginate", ">= 3.0.pre2"
gem "omniauth", ">= 0.2.2"
gem "omniauth-twitter"
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
gem 'omniauth-linkedin'
gem "exception_notification", :git => "https://github.com/rails/exception_notification.git", :require => "exception_notifier"
gem "ancestry"
gem "cancan", :git => "https://github.com/ryanb/cancan.git", :branch => "2.0"
gem "paper_trail"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end

group :production do
  gem "pg"
end
