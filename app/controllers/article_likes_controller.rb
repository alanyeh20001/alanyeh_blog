class ArticleLikesController < ApplicationController
  
  def get_user_like_records
    @user_liked_articles = ArticleLike.select("article_id").where("user_id = ?", params[:user_id])
    
    render json: @user_liked_articles.map{|x| x[:article_id]}
  end
  
  def create
    # serve as add_user_like_records action
    add_user_liked_article = ArticleLike.create(article_like_params)
    
    if add_user_liked_article.save
      render json: {status: "add article_like success"}
    else
      render json: {status: "add article_like fail"}
    end
  end
  
  def delete_user_like_records
    @delete_user_liked_article = ArticleLike.find_by("article_id = ? AND user_id = ?", params[:article_id], params[:user_id])
    
    if @delete_user_liked_article.destroy
      render json: {status: "delete article_like success"}
    else
      render json: {status: "delete article_like fail"}
    end
  end
  
  def add_like_num_to_article
   
    @article_like_num = Article.find(params[:article_id])
    @article_like_num.like += 1
    
    if @article_like_num.save
      render json: @article_like_num.like
    else
      render json: {status: "fail to add like num"}
    end
  end
  
  def minus_like_num_to_article
    @article_like_num = Article.find(params[:article_id])
    @article_like_num.like -= 1
    
    if @article_like_num.save
      render json: @article_like_num.like
    else
      render json: {status: "fail to add like num"}
    end
  end
  
  
  private
  
  def article_like_params
    params.require(:article_like).permit(:article_id, :user_id)
  end
  
end
