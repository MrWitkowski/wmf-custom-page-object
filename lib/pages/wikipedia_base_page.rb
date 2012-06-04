class Wikipedia::BasePage < WikimediaBasePage

  element(:logged_in_link) { |b| b.link(:title => 'Your user page [ctrl-.]') }
  element(:log_in_link) { |b| b.link(:text => 'Log in / create account') }

  value(:logged_in_as) { |p| p.logged_in_link.text }
  value(:not_logged_in?) { |p| p.log_in_link.exists? }

end