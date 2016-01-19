class ArticlesController < ApplicationController
  #before_action :authenticate_user!
    
  def index
    if params[:title]
      @articles = Article.search(params[:title]).order(created_at: :desc)
    else
      @articles = Article.order(created_at: :desc)
    end
    
    render json: @articles
  end
  
  def show
    @article = Article.find(params[:id])
    
    render json: @article
  end
  
  def create
    @article = Article.create(article_params)
    
    if @article.save
      render json: {status: "success", article_id: @article.id}
    else
      render json: {status: "fail"}
    end
  end
  
  def edit
    @article = Article.find(params[:id])
    
    render json: @article
  end  
  
  def update
    @article = Article.find(params[:id])
    
    if @article.update(article_params)
      render json: {status: "success"}
    else
      render json: {status: "fail"}
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    
    if @article.destroy
      render json: {status: "delete successfully"}
    else
      render json: {status: "delete failing"}
    end
  end
  
  
  private
  
  def article_params
    params.require(:article).permit(:title, :content, :category_id, :like, :browse_times, :user_id)
  end
  
end
