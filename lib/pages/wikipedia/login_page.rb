class Wikipedia::LoginPage < Wikipedia::BasePage

  page_url "#{Wikipedia::BASE_URL}/w/index.php?title=Special:UserLogin"
  expected_title "Log in / create account - #{Wikipedia::TITLE}"

  login_elements

  value(:logged_in?) { |p| p.logged_in.exists? }

  def login_with username, password
    username_field.set username
    password_field.set password
    login_button.click
  end

end