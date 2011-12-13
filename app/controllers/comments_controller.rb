class CommentsController < ApplicationController
before_filter :find_products

def find_products
@user = current_user
     @products = @user.products
end
  def index
  @user=current_user
  @article=@user.articles.find(params[:article_id])
  @comments=@article.comments.all
  end

  def show
  end

  def create
  @user=current_user
  @article=Article.find(params[:article_id])
  @comment=@article.comments.build(params[:comment])
  @comments=@article.comments
  @like = Like.new
   @comment.save

    respond_to do |format|
    format.html  {redirect_to :back}
    format.js
    end
  end

  def new
  @user=current_user
  @article=@user.articles.find(params[:article_id])
  @comments=@article.comments.build
  end

  def edit
  end

  def update
  end

  def destroy
    @article=Article.find(params[:article_id])
    @comment=@article.comments.find(params[:id])
    @comment.destroy
    @comments=@article.comments.all
    respond_to do |format|
    format.html  {redirect_to :back}
    format.js
    end
     
  end

end
