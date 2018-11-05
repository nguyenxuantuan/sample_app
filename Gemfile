source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.1"

gem "rails"
gem "bcrypt", "3.1.12"
gem "bootstrap-sass", "3.3.7"
gem "sqlite3"
gem "puma", "~> 3.11"
gem "sass-rails"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "bootsnap", ">= 1.1.0", require: false
gem "config"
gem "rails-i18n"
gem "jquery-rails"

group :test do
  gem "selenium-webdriver", "2.35.1"
  gem "capybara", "2.1.0"
  gem "factory_girl_rails"
end

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "web-console"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
