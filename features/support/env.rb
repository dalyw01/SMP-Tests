require 'capybara'
require 'capybara/dsl'
require 'cucumber'
require 'selenium-webdriver'
require 'rspec'
require 'touch_action'
require 'image_size'
require 'chunky_png'
require 'browserstack-automate'

BrowserStack.for "cucumber"
Capybara.default_driver = :selenium

# Rest of the configuration file remains unchanged
browser = Selenium::WebDriver.for :firefox

Before do |scenario|
  @browser = browser
end

at_exit do
  browser.quit
end

# A Capybara thing that needs to be here
# World(Capybara::DSL)

# This is a chunk of code to stop selenium auto-quitting when complete
# Capybara::Selenium::Driver.class_eval do
#   def quit
#     puts "Press RETURN to quit the browser"
#     $stdin.gets
#     @browser.quit
#   rescue Errno::ECONNREFUSED
#     # Browser must have already gone
#   end
# end