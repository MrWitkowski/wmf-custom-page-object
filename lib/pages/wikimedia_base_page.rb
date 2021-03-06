class WikimediaBasePage < GenericBasePage

  element(:logged_in_link) { |b| b.link(title: /^Your user page.+/) }
  element(:log_in_link) { |b| b.link(text: 'Log in') }

  value(:logged_in_as) { |p| p.logged_in_link.text }
  value(:not_logged_in?) { |p| p.log_in_link.exists? }
  value(:logged_in?) {|p| p.logged_in_link.exists? }

  def self.login_elements
    element(:username_field) { |b| b.text_field(id: 'wpName1') }
    element(:password_field) { |b| b.text_field(id: 'wpPassword1') }
    element(:login_button) { |b| b.button(id: 'wpLoginAttempt') }
    element(:logged_in) { |b| b.span(text: 'Login successful') }
  end

end