source 'https://rubygems.org'

ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.4'

# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.2'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

#quick form creation
gem 'simple_form'

#bootstrap for simple design
gem 'twitter-bootstrap-rails'

#bootstrap dependancy
gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS

#to use attra_accesible
gem "protected_attributes"

#needed for the assets for heroku pipeline
gem 'rails_12factor'

# Use the hash function for random values
gem 'bcrypt', '~> 3.1.7'

#to access from dev and test, rspec tests
gem 'rspec-rails'


group :test do
  gem 'launchy'          # a useful debugging aid for user stories
  gem 'database_cleaner' # to clear Cucumber's test database between runs, only needed in testing
  gem 'selenium-webdriver' #for js testing
  gem 'cucumber-rails', :require => false
  gem 'cucumber-rails-training-wheels'
  gem 'factory_girl_rails'
  gem 'capybara'
end
