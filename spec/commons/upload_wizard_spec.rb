describe 'Commons Upload Wizard' do
  context 'Login is required' do
    it 'should be available when logged in' do
      Commons::ensure_logged_in
      visit Commons::UploadWizardPage do |page|
        page.title.should == "Upload Wizard - #{Commons::TITLE}"
        page.should have_upload_wizard_content
      end
    end
    it 'should not be available when not logged in' do
      Commons::ensure_logged_out
      visit Commons::UploadWizardPage do |page|
        page.title.should == "Error"
        page.should_not have_upload_wizard_content
      end
    end
  end
end