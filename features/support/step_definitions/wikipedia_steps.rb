Given /^I am logged into Wikipedia$/ do
  Wikipedia.ensure_logged_in
end

Given /^I am not logged into Wikipedia$/ do
  Wikipedia.ensure_logged_out
end

When /^I visit the Wikipedia main page$/ do
  visit Wikipedia::MainPage
end

When /^I visit a random page$/ do
  @article_name = visit(Wikipedia::RandomArticlePage).article_name
end

When /^I visit my user page$/ do
  visit Wikipedia::UserPage
end

When /^I edit the page by adding some arbitrary text$/ do
  @content_added, @edit_message = Wikipedia.edit_user_page_by_adding_new_content
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
    page.history_content.should include @edit_message
    page.history_content.should include Wikipedia::USERNAME
  end
end