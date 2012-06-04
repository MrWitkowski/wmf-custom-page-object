class Wikipedia::RandomArticlePage < Wikipedia::BasePage

  page_url "#{Wikipedia::BASE_URL}/wiki/User:#{Wikipedia::USERNAME}"

  view_article_elements

end