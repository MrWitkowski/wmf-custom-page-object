Given /^I am logged into Wikipedia$/ do
  visit Wikipedia::LoginPage do |page|
    page.login_with Wikipedia::USERNAME, Wikipedia::PASSWORD
    page.should be_logged_in
  end
end

Given /^I am not logged into Wikipedia$/ do
  visit(Wikipedia::LogoutPage).main_content.should include 'You are now logged out.'
end

Given /^I record my IP address$/ do
  visit IfConfigPage do |page|
    @ip_address = page.ip_address
  end
end

When /^I visit the Wikipedia main page$/ do
  visit Wikipedia::MainPage
end

When /^I visit a random page$/ do
  @article_name = visit(Wikipedia::RandomArticlePage).article_name
end

When /^I edit the page by adding some arbitrary text$/ do
  on Wikipedia::ViewArticlePage do |page|
    page.edit
  end
  on Wikipedia::EditArticlePage do |page|
    @content_added = page.append_random_content
  end
end

Then /^I can see I am logged into Wikipedia$/ do
  on(Wikipedia::MainPage).logged_in_as.should == Wikipedia::USERNAME
end

Then /^I can see I am not logged in Wikipedia$/ do
  on(Wikipedia::MainPage).should be_not_logged_in
end

Then /^I can see the arbitrary text has been saved on the page$/ do
  on Wikipedia::ViewArticlePage do |page|
    page.page_content.should include @content_added
  end
end

Then /^the user edit appears in the revision history$/ do
  on Wikipedia::ViewArticlePage do |page|
    page.view_history
    page.history_content.should include @content_added
    page.hisotry_content.should include Wikipedia::USERNAME
  end
end

Then /^the IP address edit appears in the revision history$/ do
  on Wikipedia::ViewArticlePage do |page|
    page.view_history
    page.history_content.should include @content_added
    page.history_content.should include @ip_address
  end
end