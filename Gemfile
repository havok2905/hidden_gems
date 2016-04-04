source 'https://rubygems.org'

gem 'rails',      '4.2.4'
gem 'rails-api'
gem 'active_model_serializers'
gem 'pg',         '~> 0.18.4'
gem 'uglifier',   '>= 1.3.0'
gem 'jbuilder',   '~> 2.0'
gem 'sdoc',       '~> 0.4.0', group: :doc

# Use Unicorn as the app server
# gem 'unicorn'

gem 'capistrano-rails', group: :development

group :development, :test do# Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'pry'
  gem 'rspec-rails',      '~> 3.0'
  gem 'annotate'
  gem 'shoulda',          '~> 3.5'
  gem 'factory_girl_rails'
  gem 'database_cleaner', '~> 1.5', '>= 1.5.1'
  gem 'dotenv-rails'
end

group :development do
  gem 'web-console', '~> 2.0'
end

gem 'rails_12factor', group: :production
