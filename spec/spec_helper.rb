$: << File.dirname(__FILE__)+'/../lib'

ENVIRONMENT = (ENV['ENVIRONMENT'] || 'beta').to_sym
raise "You need to create a configuration file named '#{ENVIRONMENT}.yml' under lib/config" unless File.exists? "#{File.dirname(__FILE__)}/../lib/config/#{ENVIRONMENT}.yml"

require 'watir-webdriver'
require 'rspec'

$browser = Watir::Browser.new

require 'page_helper'
require 'env_config'
require 'wikipedia'
require 'commons'
require 'pages'

RSpec.configure do |config|
  config.after(:suite) { $browser.close }
  config.include PageHelper
end