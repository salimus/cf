require 'selenium-webdriver'
require 'rspec'
# require 'rubygems'

def create_browser
  @browser = Selenium::WebDriver.for :chrome
  Selenium::WebDriver::Wait.new(:timeout => 5)    # waiting for an elements on the page
  @browser.manage.window.maximize
end