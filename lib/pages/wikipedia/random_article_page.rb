class Wikipedia::RandomArticlePage < Wikipedia::BasePage

  page_url "#{Wikipedia::BASE_URL}/wiki/Special:Random"

  view_article_elements

end