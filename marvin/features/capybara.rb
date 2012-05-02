require 'capybara/cucumber'

Capybara.configure do |config|
  config.default_driver = :selenium
  config.app_host = "http://127.0.0.1:8080/marvin-console"
end
