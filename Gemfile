source 'https://rubygems.org'

gem 'rails', '~> 4.2.7.1'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'haml'
gem 'haml-rails'

# bundle exec rake doc:rails generates the API under doc/api.

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'spree', '~> 3.1.0'
gem 'spree_auth_devise', '~> 3.1.0'
gem 'spree_gateway', '~> 3.1.0'
gem 'spree_videos', git: 'https://github.com/clevertechru/spree_videos.git', branch: '3-1-stable'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'mysql2'
end

group :development, :staging do
  gem 'safety_mailer', '~> 0.0.10'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'better_errors'
  gem 'pry'

  gem 'capistrano', '~> 3.6.1', require: false
  gem 'capistrano-rails', '~> 1.1.8', require: false
  gem 'capistrano-bundler', '~> 1.1.2', require: false
  gem 'capistrano-rvm', '0.1.2', require: false
  gem 'capistrano-passenger', '~> 0.2', require: false
end

group :staging, :production do
  gem 'airbrake', '~> 5.4.5'
end

