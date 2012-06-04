class Commons::UploadWizardPage < Commons::BasePage

  page_url "#{Commons::BASE_URL}/wiki/Special:UploadWizard"

  element(:upload_wizard_div) { |b| b.div(id: 'upload-wizard')}
  value(:has_upload_wizard_content?) { |p| p.upload_wizard_div.exists? }

end