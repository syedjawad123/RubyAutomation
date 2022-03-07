require 'rubygems'
require 'selenium-webdriver'

Before do |scenario|
    browser = gets.chomp
    if "chrome".eql?(browser)
        Selenium::WebDriver::Chrome::Service.driver_path= "/Users/sapaad/Downloads/chromedriver"
        $driver = Selenium::WebDriver.for :chrome
        $driver.manage.window.maximize
        $wait = Selenium::WebDriver::Wait.new(:timeout=> 15)
    elsif "firefox".eql?(browser)
        Selenium::WebDriver::Firefox::driver_path= "/Users/sapaad/Downloads/geckodriver"
        $driver = Selenium::WebDriver.for :firefox
        $driver.manage.window.maximize
        $wait = Selenium::WebDriver::Wait.new(:timeout=> 15)
    elsif "safari".eql?(browser)
        $driver = Selenium::WebDriver.for :safari
        $driver.manage.window.maximize
        $wait = Selenium::WebDriver::Wait.new(:timeout=> 15)
    end
end

After do |scenario|
    $driver.quit
end