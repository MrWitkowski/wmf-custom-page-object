require 'pages/generic_base_page'
require 'pages/wikimedia_base_page'
require 'pages/commons_base_page'
require 'pages/wikipedia_base_page'
Dir["#{File.dirname(__FILE__)}/pages/*/*_page.rb"].each {|r| load r }
Dir["#{File.dirname(__FILE__)}/pages/*_page.rb"].each {|r| load r }

module Pages
  def visit page_class, &block
    on page_class, true, &block
  end

  def on page_class, visit=false, &block
    page = page_class.new @browser, visit
    block.call page if block
    page
  end
end