source 'https://rubygems.org'

gem 'rails', '~> 4.2.8'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'haml'
gem 'haml-rails'
gem 'mmenu-rails', '~> 5.5', '>= 5.5.3'
gem 'masonry-rails'
gem 'to_xls'
gem 'datashift'
gem 'datashift_spree'

# bundle exec rake doc:rails generates the API under doc/api.

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'spree', '~> 3.1.0'
gem 'font-awesome-rails'
gem 'spree_auth_devise', '~> 3.1.0'
gem 'spree_gateway', '~> 3.1.0'
gem 'spree_videos', git: 'https://github.com/vladimir-shidlovsky/spree_videos.git', branch: '3-1-stable'
# gem 'spree_videos', path: 'lib/gems/spree_videos'
gem 'spree_chimpy', git: 'https://github.com/vladimir-shidlovsky/spree_chimpy.git', branch: '3-stable'
gem 'spree_static_content', git: 'https://github.com/spree-contrib/spree_static_content.git', branch: 'master'
gem 'aws-sdk', '< 2.0'

source 'https://rails-assets.org' do
  gem 'rails-assets-material-design-iconic-font'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
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
  gem 'annotate'
end

group :staging, :production do
  gem 'airbrake', '~> 5.4.5'
end


source 'https://rails-assets.org' do
  gem 'rails-assets-matchHeight', '~> 0.7.0'
end
