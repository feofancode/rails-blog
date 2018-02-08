class HomeController < ApplicationController
  layout 'blog'
  
  def index
  	@articles = Article.order(published_at: :desc)
  end
end
