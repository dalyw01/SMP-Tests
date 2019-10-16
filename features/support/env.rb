require 'capybara'
require 'capybara/dsl'
require 'cucumber'
require 'selenium-webdriver'
require 'rspec'
require 'touch_action'
require 'image_size'
require 'chunky_png'
require 'rubygems'
require 'browserstack-automate'

# Input capabilities
# New ones can be made here - https://www.browserstack.com/automate/capabilities

caps = Selenium::WebDriver::Remote::Capabilities.new
caps["os"] = "Windows"
caps["os_version"] = "10"
caps["browser"] = "Chrome"
caps['name'] = "SMP X"
caps['resolution'] = "1920x1080"
caps["browserstack.selenium_version"] = "3.141.59"

# Need this so it works with BrowserStack
BrowserStack.for "cucumber"

# Gets visit() to work
World(Capybara::DSL)

# Use selenium locally, uncomment this
# Capybara.default_driver = :selenium
# Capybara.register_driver :selenium do |app|
#   Capybara::Selenium::Driver.new app, 
#   browser: ENV['BROWSER'].to_sym	
# end

# Use selenium on Browserstack, uncomment this
# https://www.browserstack.com/automate/ruby
Capybara.register_driver :browserstack do |app|
  Capybara::Selenium::Driver.new app,
   :browser => :remote,
   :url => "",
   :desired_capabilities => caps
end
Capybara.default_driver = :browserstack







