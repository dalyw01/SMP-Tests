require 'capybara'
require 'capybara/dsl'
require 'cucumber'
require 'selenium-webdriver'
require 'rspec'

Capybara.default_driver = :selenium

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new app, browser: ENV['BROWSER'].to_sym
end

World(Capybara::DSL)

Capybara::Selenium::Driver.class_eval do
  def quit
    puts "Press RETURN to quit the browser"
    $stdin.gets
    @browser.quit
  rescue Errno::ECONNREFUSED
    # Browser must have already gone
  end
end
