require 'capybara/cucumber'

Capybara.configure do |config|
  config.default_driver = :selenium
  #config.app_host = "http://squeaker.heroku.com"
  config.app_host = 'http://10.164.40.182:3000/'
end
