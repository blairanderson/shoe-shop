ruby '2.1.1'
source 'https://rubygems.org'

# gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'
gem 'acts_as_votable', '~> 0.6.0' #https://github.com/ryanto/acts_as_votable
gem 'impressionist'
# resque http://stackoverflow.com/a/11235919/1536309

gem 'simple_form', '~> 3.0.1'
gem 'active_model_serializers', '0.8.1'
gem 'sorcery', '0.8.5'
gem 'simple_enum', '1.6.8'
gem 'sendgrid', '1.2.0'
gem 'kaminari', '0.15.0'
gem 'nokogiri', '1.6.1'
gem 'dalli'

gem 'omniauth', '1.1.4'
gem 'omniauth-twitter', '1.0.1'
gem 'twitter', '~> 5.3.0'
gem 'bootstrap-sass', '~> 3.0.3.0'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'swiftype', '~> 1.0.1'
gem 'ember-rails'
gem 'ember-source', '1.3.0' # or the version you need

group :production do
  gem 'newrelic_rpm'
  gem 'unicorn'
  gem 'pg'
  gem 'rails_12factor'
end

group :test, :development do
  gem 'figaro'
  gem 'sqlite3'
  gem 'faker'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'pry-rails'
end

group :development do
  gem 'bullet'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test do
  gem 'simplecov', '~> 0.7.1', :require => false
  gem 'coveralls', require: false
  gem 'database_cleaner'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'shoulda-matchers', '2.2.0'

  gem 'guard'
  gem 'guard-rspec'
  gem 'rb-fsevent'  # guard dependency
  gem 'launchy'
end
