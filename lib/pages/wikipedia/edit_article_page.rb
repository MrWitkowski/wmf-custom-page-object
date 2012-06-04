# Represents any Wikipedia article
class Wikipedia::EditArticlePage < Wikipedia::BasePage

  element(:content_field) { |b| b.text_field id: 'wpTextbox1' }
  element(:edit_summary_field) { |b| b.text_field id: 'wpSummary' }
  element(:minor_edit_checkbox) { |b| b.checkbox id: 'wpMinoredit' }
  element(:save_button) { |b| b.button id: 'wpSave'}

  def append_random_content
    random_string = Wikipedia::random_string
    content_field.set "#{content_field.text}\n\n#{random_string}"
    edit_summary_field.set random_string
    save_button.click
    random_string
  end

end