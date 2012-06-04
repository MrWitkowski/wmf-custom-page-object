class Wikipedia::RandomArticlePage < Wikipedia::BasePage

  page_url "#{Wikipedia::BASE_URL}/wiki/Special:Random"

  element(:article_name_h1) {|b| b.h1(id: 'firstHeading')}
  value(:article_name) {|p| p.article_name_h1.text }

end