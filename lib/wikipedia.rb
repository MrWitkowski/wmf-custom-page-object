require 'env_config'
require 'quoth'

module Wikipedia
  SITE = :wikipedia
  TITLE = 'Wikipedia, the free encyclopedia'
  BASE_URL = EnvConfig.get SITE, :url
  USERNAME = EnvConfig.get :username
  PASSWORD = EnvConfig.get :password

  def self.random_string
    Quoth.get
  end



end