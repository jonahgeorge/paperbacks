source 'https://rubygems.org'

gem 'rails', '4.2'
gem 'pg'
gem 'postmark-rails'
gem 'uglifier', '>= 1.3.0'
gem 'sass-rails', '~> 4.0.3'
gem 'autoprefixer-rails'
gem 'jquery-rails'
gem 'bootstrap-sass', '~> 3.3.1'
gem 'bcrypt', '~> 3.1.7'

group :production do
  # gem 'unicorn'
  gem 'passenger'
  gem 'rails_12factor'
end

group :development, :test do
  gem 'codeclimate-test-reporter', require: nil
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'dotenv-rails'
end

group :development do
  gem 'spring'
end

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc
