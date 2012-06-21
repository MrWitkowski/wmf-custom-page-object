Given /^I am logged into Commons$/ do
  Commons.ensure_logged_in
end

Given /^I am not logged into Commons$/ do
  Commons.ensure_logged_out
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