require 'selenium-webdriver'
require 'rspec'

# Import all files from a given directory, so nothing needs to get updated once adding/removing from there
Dir[File.dirname(__FILE__) + '/pages/*.rb'].each {|file| require_relative file}

# Let's restrict this to Firefox because it's only a code sample
#
def setup
  $driver = Selenium::WebDriver.for :firefox
end

# Make sure to exit the browser after each test
#
def teardown
  $driver.quit
end

RSpec.configure do |c|
  c.before :each do
    setup
  end

  c.after :each do
    teardown
  end

  c.after :suite do
    puts 'All tests have ran'
  end
end

# Helper method to load Imgur
#
def load_imgur
  $driver.navigate.to 'https://imgur.com/'
end

# Helper method to return the title of the current page
#
def get_page_title
  $driver.title
end

# Helper method to get the current URL
#
def get_page_url
  $driver.current_url
end