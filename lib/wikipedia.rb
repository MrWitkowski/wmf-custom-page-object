require 'env_config'
require 'uuid'

module Wikipedia
  SITE = :wikipedia
  TITLE = 'Wikipedia, the free encyclopedia'
  BASE_URL = EnvConfig.get SITE, :url
  USERNAME = EnvConfig.get :username
  PASSWORD = EnvConfig.get :password

  def self.random_string
    UUID.new.generate
  end

end