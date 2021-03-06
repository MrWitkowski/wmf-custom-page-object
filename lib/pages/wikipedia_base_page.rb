class Wikipedia::BasePage < WikimediaBasePage

  def self.view_article_elements
    element(:article_name_h1) { |b| b.h1 id: 'firstHeading' }
    element(:content_div) { |b| b.div id: 'bodyContent' }
    element(:edit_link) { |b| b.link text: 'Edit'}
    element(:view_history_link) { |b| b.link text: 'View history'}
    element(:history_ul) { |b| b.ul id: 'pagehistory' }

    value(:article_name) {|p| p.article_name_h1.text }
    value(:page_content) { |p| p.content_div.text }
    value(:history_content) { |p| p.history_ul.text }

    action(:edit) { |p| p.edit_link.click }
    action(:view_history) { |p| p.view_history_link.click }
  end
end