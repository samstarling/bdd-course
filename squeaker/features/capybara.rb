require 'capybara/cucumber'

Capybara.configure do |config|
  config.default_driver = :selenium
  config.app_host = "http://squeaker.heroku.com"
end
