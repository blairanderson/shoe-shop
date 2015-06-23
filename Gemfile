ruby '2.2.0'
source 'https://rubygems.org'

# gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'
gem 'pg'
gem 'devise'
gem 'simple_form', '~> 3.0.1'
gem 'active_model_serializers', '0.8.1'
gem 'quiet_assets'
gem 'simple_enum', '1.6.8'
gem 'sendgrid', '1.2.0'
gem 'kaminari', '0.15.0'
gem 'nokogiri', '1.6.1'
gem 'dalli'
gem 'algoliasearch-rails'
gem 'yolobar', github: 'blairanderson/yolobar'

gem 'omniauth', '1.1.4'
gem 'omniauth-twitter', '1.0.1'
gem 'twitter', '~> 5.3.0'
gem 'sass-rails', '~> 4.0.0'
gem 'bootstrap-sass', '~> 3.2.0'
gem 'autoprefixer-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'paloma'

group :production do
  gem 'newrelic_rpm'
  # gem 'unicorn'
  gem 'rails_12factor'
end

group :test, :development do
  gem 'figaro'
  gem 'faker'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'pry-rails'
end

group :development do
  gem 'bullet'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'letter_opener'
end

group :test do
  gem 'simplecov', '~> 0.7.1', :require => false
  gem 'codeclimate-test-reporter', require: nil
  gem 'database_cleaner'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'shoulda-matchers', '2.2.0'

  gem 'launchy'
end
