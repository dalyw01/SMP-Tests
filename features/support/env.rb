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

# Need this so it works with BrowserStack
BrowserStack.for "cucumber"

# Gets visit() to work
World(Capybara::DSL)

# Use selenium
Capybara.default_driver = :selenium

puts "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
puts "Hello BROWSER which is  #{ENV['BROWSER'].to_sym}"
puts "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

# This assigns any BROWSER env variable to an actual browser
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new app, 
  browser: ENV['BROWSER'].to_sym
end