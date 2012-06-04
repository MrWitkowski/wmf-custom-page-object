Given /^I am logged into Commons$/ do
  visit Commons::LoginPage do |page|
    page.login_with Commons::USERNAME, Commons::PASSWORD
    page.should be_logged_in
  end
end

Given /^I am not logged into Commons$/ do
  visit(Commons::LogoutPage).main_content.should include 'You are now logged out.'
end

When /^I visit the Upload Wizard$/ do
  visit Commons::UploadWizardPage
end

Then /^I should see the Upload Wizard content$/ do
  on Commons::UploadWizardPage do |page|
    page.title.should == "Upload Wizard - #{Commons::TITLE}"
    page.should have_upload_wizard_content
  end
end

Then /^I should not see the Upload Wizard content$/ do
  on Commons::UploadWizardPage do |page|
    page.title.should == "Error"
    page.should_not have_upload_wizard_content
  end
end