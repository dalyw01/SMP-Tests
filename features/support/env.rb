require 'capybara'
require 'capybara/dsl'
require 'cucumber'
require 'selenium-webdriver'
require 'rspec'
require 'touch_action'
require 'image_size'
require 'chunky_png'
require 'capybara/poltergeist'
require 'appium_capybara'
require 'appium_lib'
# require 'device_api/android'
# require 'device_api/ios'
# require 'pry'

# Capybara.default_driver = :selenium
#
# # This assigns any BROWSER env variable to an actual browser
# Capybara.register_driver :selenium do |app|
#   Capybara::Selenium::Driver.new app, browser: ENV['BROWSER'].to_sym
# end
#
# # A Capybara thing that needs to be here
# World(Capybara::DSL)
#
# # This is a chunk of code to stop selenium auto-quitting when complete
# # Capybara::Selenium::Driver.class_eval do
# #   def quit
# #     puts "Press RETURN to quit the browser"
# #     $stdin.gets
# #     @browser.quit
# #   rescue Errno::ECONNREFUSED
# #     # Browser must have already gone
# #   end
# # end

driver = ENV['DRIVER']

if ENV['DEVICE']
  # first_device = ENV['DEVICE'] == 'android' ? DeviceAPI::Android.devices.first : DeviceAPI::IOS.devices.first
  ENV['DEVICE_NAME'] = 'Galaxy note5'
  ENV['DEVICE_VERSION'] = '6.0.1'
  ENV['DEVICE_SERIAL_NO'] = '836f4a42344d5836'
end

current_driver = 'selenium'.to_sym
current_driver = driver.to_sym if driver == 'appium'

def appium_caps
  {
    'android' => { platformName: 'Android', deviceName: ENV['DEVICE_NAME'], udid: ENV['DEVICE_SERIAL_NO'], versionNumber: ENV['DEVICE_VERSION'], browserName: 'Chrome' },
    'iOS' => { platformName: 'iOS', deviceName: ENV['DEVICE_NAME'], udid: ENV['DEVICE_SERIAL_NO'], versionNumber: ENV['DEVICE_VERSION'], automationName: 'XCUITest', browserName: 'Safari', startIWDP: true},
  }
end

Capybara.register_driver current_driver do |app|
  if current_driver == :appium
    caps = appium_caps.fetch(ENV['DEVICE'])
    puts caps.to_s
    url = "http://localhost:4723/wd/hub/" # Url to your running appium server
    appium_lib_options = { server_url: url }
    all_options = { appium_lib:  appium_lib_options, caps: caps }
    Appium::Capybara::Driver.new app, all_options
  else
    Capybara::Selenium::Driver.new(app, browser: :chrome)
  end
end


Capybara.default_driver = current_driver.to_sym
World(Capybara::DSL)
