# Represents any Wikipedia article
class Wikipedia::EditArticlePage < Wikipedia::BasePage

  element(:content_field) { |b| b.text_field id: 'wpTextbox1' }
  element(:edit_summary_field) { |b| b.text_field id: 'wpSummary' }
  element(:minor_edit_checkbox) { |b| b.checkbox id: 'wpMinoredit' }
  element(:save_button) { |b| b.button id: 'wpSave'}

  def append_random_content
    random_string = Wikipedia::random_string
    edit_summary = "Automated tests against Wikimedia: see my user page for details please (#{random_string[0..19]})"
    content_field.send_keys :end, :enter
    content_field.send_keys random_string
    edit_summary_field.set edit_summary
    save_button.click
    return random_string, edit_summary
  end

end