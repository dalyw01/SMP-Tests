# require 'rubygems'
# require 'selenium-webdriver'

# Input capabilities
# caps = Selenium::WebDriver::Remote::Capabilities.new
# caps['browser'] = 'Chrome'
# caps['browser_version'] = '77.0 beta'
# caps['os'] = 'Windows'
# caps['os_version'] = '10'
# caps['resolution'] = '1024x768'
# caps['name'] = 'Bstack-[Ruby] Sample Test'

# driver = Selenium::WebDriver.for(:remote,
#   :url => "http://williamdaly1:L7qARqDjWTr5rp8G2s37@hub-cloud.browserstack.com/wd/hub",
#   :desired_capabilities => caps)
# driver.navigate.to "http://www.google.com"
# element = driver.find_element(:name, 'q')
# element.send_keys "BrowserStack"
# element.submit
# puts driver.title
# driver.quit