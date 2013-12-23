ruby '2.0.0'
source 'https://rubygems.org'

# gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'
gem 'acts_as_votable', '~> 0.6.0' #https://github.com/ryanto/acts_as_votable
gem 'impressionist'
# resque http://stackoverflow.com/a/11235919/1536309

gem 'simple_form'
gem 'newrelic_rpm'
gem 'active_model_serializers'
gem 'sorcery'
gem 'simple_enum'
gem 'sendgrid'
gem 'kaminari'

gem 'omniauth'
gem 'omniauth-twitter'
gem 'twitter', '~> 5.3.0'

gem 'bootstrap-sass', github: 'thomas-mcdonald/bootstrap-sass', branch: '3'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'unicorn'

group :production do 
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
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'style-guide'
end

group :test do 
  gem 'rspec-rails'
  gem 'capybara'
  gem 'shoulda-matchers', '2.2.0'

  gem 'guard'
  gem 'guard-rspec'
  gem 'rb-fsevent'  # guard dependency
  gem 'launchy'
end
