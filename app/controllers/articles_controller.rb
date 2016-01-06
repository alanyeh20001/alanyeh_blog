class ArticlesController < ApplicationController
  
  def get_articles
    @articles = Article.all
    
    render json: @articles
  end
  
  def show
    @article = Article.find(params[:id])
    
    render json: @article
  end
  
  
end
