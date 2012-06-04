class Wikipedia::LogoutPage < Wikipedia::BasePage

  page_url "#{Wikipedia::BASE_URL}/w/index.php?title=Special:UserLogout"
  expected_title "Log out - #{Wikipedia::TITLE}"

  element(:main_content_div) { |b| b.div(id: 'mw-content-text' ) }

  value(:main_content) { |p| p.main_content_div.text }
end