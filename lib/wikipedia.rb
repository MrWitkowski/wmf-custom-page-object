require 'env_config'
require 'quoth'

module Wikipedia

  extend PageHelper
  extend RSpec::Expectations
  extend RSpec::Matchers

  class << self; attr_accessor :browser end

  SITE = :wikipedia
  TITLE = 'Wikipedia, the free encyclopedia'
  BASE_URL = EnvConfig.get SITE, :url
  USERNAME = EnvConfig.get :username
  PASSWORD = EnvConfig.get :password

  def self.random_string
    Quoth.get
  end

  def self.ensure_logged_in
    visit Wikipedia::LoginPage do |page|
      page.login_with USERNAME, PASSWORD
      page.should be_logged_in
    end
  end

  def self.ensure_logged_out
    visit(Wikipedia::LogoutPage).main_content.should include 'You are now logged out.'
  end

  def self.edit_user_page_by_adding_new_content
    visit(Wikipedia::UserPage).edit
    on(Wikipedia::EditArticlePage) do |page|
      return page.append_random_content
    end
  end
end