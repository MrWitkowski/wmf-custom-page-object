class Commons::LogoutPage < Commons::BasePage

  page_url "#{Commons::BASE_URL}/w/index.php?title=Special:UserLogout"
  expected_title "Log out - #{Commons::TITLE}"

  element(:main_content_div) { |b| b.div(id: 'mw-content-text' ) }

  value(:main_content) { |p| p.main_content_div.text }
end