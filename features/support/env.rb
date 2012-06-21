$: << File.dirname(__FILE__)+'/../lib'

ENVIRONMENT = (ENV['ENVIRONMENT'] || 'beta').to_sym
raise "You need to create a configuration file named '#{ENVIRONMENT}.yml' under lib/config" unless File.exists? "#{File.dirname(__FILE__)}/../../lib/config/#{ENVIRONMENT}.yml"

require 'watir-webdriver'
require 'rspec'

$browser = Watir::Browser.new

require 'page_helper'
require 'env_config'
require 'wikipedia'
require 'commons'
require 'pages'

World PageHelper
World Wikipedia
World Commons

After do |scenario|
  if scenario.failed?
    Dir::mkdir('screenshots') if not File.directory?('screenshots')
    screenshot = "./screenshots/FAILED_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
    $browser.driver.save_screenshot(screenshot)
    embed screenshot, 'image/png'
  end
  $browser.cookies.clear
end

at_exit { $browser.close }