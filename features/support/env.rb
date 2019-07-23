require 'capybara'
require 'capybara/dsl'
require 'cucumber'
require 'selenium-webdriver'
require 'rspec'
require 'touch_action'
require 'image_size'
require 'chunky_png'

Capybara.default_driver = :selenium

# This assigns any BROWSER env variable to an actual browser
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new app, browser: ENV['BROWSER'].to_sym
end

# A Capybara thing that needs to be here
World(Capybara::DSL)

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