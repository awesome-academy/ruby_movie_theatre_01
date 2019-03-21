source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}

gem "bcrypt", "~> 3.1", ">= 3.1.12"
gem "bootsnap", ">= 1.1.0", require: false
gem "bootstrap", "~> 4.2", ">= 4.2.1"
gem "carrierwave", "1.2.2"
gem "ckeditor"
gem "coffee-rails", "~> 4.2"
gem "config"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "mini_magick", "4.7.0"
gem "puma", "~> 3.11"
gem "rails", "~> 5.2.2"
gem "rails-i18n"
gem "sass-rails", "~> 5.0"
# gem "turbolinks", "~> 5"
gem "recaptcha", require: "recaptcha/rails"
gem "uglifier", ">= 1.3.0"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara"
  gem "database_cleaner"
  gem "factory_bot_rails"
  gem "faker"
  gem "rspec-rails"
  gem "rubocop", "~> 0.54.0", require: false
  gem "shoulda-matchers"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
  # gem "sqlite3"
  gem "mysql2", "~> 0.5.2"
end

group :test do
  gem "chromedriver-helper"
  gem "selenium-webdriver"
  gem "simplecov", require: false
  gem "simplecov-rcov", require: false
end

group :production do
  gem "pg", "~> 1.1", ">= 1.1.4"
  gem "rails_12factor"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
