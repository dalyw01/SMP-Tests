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
caps["browser_version"] = "78.0 beta"
caps['name'] = 'Bstack-[Ruby] Sample Test ZZZZZ'


# Need this so it works with BrowserStack
BrowserStack.for "cucumber"

# Gets visit() to work
World(Capybara::DSL)

# Use selenium
#Capybara.default_driver = :selenium

# This assigns any BROWSER env variable to an actual browser
Capybara.register_driver :browserstack do |app|
  Capybara::Selenium::Driver.new app,
   :browser => :remote,
   :url => "http://williamdaly1:L7qARqDjWTr5rp8G2s37@hub-cloud.browserstack.com/wd/hub",
   :desired_capabilities => caps
end

Capybara.default_driver = :browserstack







