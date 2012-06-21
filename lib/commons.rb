require 'rspec'

module Commons

  extend PageHelper
  extend RSpec::Expectations
  extend RSpec::Matchers

  SITE = :commons
  TITLE = 'Wikimedia Commons'
  BASE_URL = EnvConfig.get SITE, :url
  USERNAME = EnvConfig.get :username
  PASSWORD = EnvConfig.get :password

  def self.ensure_logged_in
    visit Commons::LoginPage do |page|
      page.login_with Commons::USERNAME, Commons::PASSWORD
      page.should be_logged_in
    end
  end

  def self.ensure_logged_out
    visit(Commons::LogoutPage).main_content.should include 'You are now logged out.'
  end
end