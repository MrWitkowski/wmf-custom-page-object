module Commons
  SITE = :commons
  TITLE = 'Wikimedia Commons'
  BASE_URL = EnvConfig.get SITE, :url
  USERNAME = EnvConfig.get :username
  PASSWORD = EnvConfig.get :password
end